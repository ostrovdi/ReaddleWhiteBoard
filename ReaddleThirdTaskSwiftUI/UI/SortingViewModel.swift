//
//  SortingViewModel.swift
//  ReaddleThirdTaskSwiftUI
//
//  Created by Dmytro Ostrovka on 30.11.2023.
//

import Foundation
import Combine

final class SortingViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var arrayInput: String = ""
    @Published var sortingSteps: [SortingStep] = []
    @Published var isSortingComplete: Bool = false
    @Published var currentStepIndex: Int = 0
    
    var selectedAlgorithm: SortingAlgorithm = .bubbleSort
    
    private var startTime: Date?
    private var endTime: Date?

    var elapsedTime: String {
        guard let start = startTime, let end = endTime else { return "" }
        let timeInterval = end.timeIntervalSince(start)
        return String(format: "%.7f seconds", timeInterval)
    }

    // MARK: - Internal methods
    func generateLargeDataSet() {
        let largeArray = (1...100).map { _ in Int.random(in: 1...1000) }
        self.arrayInput = largeArray.reduce(into: "", { result, value in
            result += "\(value), "
        })
    }
    
    func startSorting() {
        let array = arrayInput
            .split(separator: ",")
            .compactMap({ Int($0.trimmingCharacters(in: .whitespaces)) })

        startTime = Date()
        
        switch selectedAlgorithm {
        case .bubbleSort:
            sortingSteps = BubbleSort.sortSteps(for: array)
        case .mergeSort:
            sortingSteps = MergeSort.sortSteps(for: array)
        }
        
        endTime = Date()
        
        currentStepIndex = sortingSteps.count - 1
        isSortingComplete = currentStepIndex == sortingSteps.count - 1
    }

    func stepForward() {
        if currentStepIndex < sortingSteps.count - 1 {
            currentStepIndex += 1
        }
        isSortingComplete = currentStepIndex == sortingSteps.count - 1
    }

    func stepBackward() {
        if currentStepIndex > 0 {
            currentStepIndex -= 1
            isSortingComplete = false
        }
    }
}

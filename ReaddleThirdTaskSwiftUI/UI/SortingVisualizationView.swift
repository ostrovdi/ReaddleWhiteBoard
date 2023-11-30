//
//  SortingVisualizationView.swift
//  ReaddleThirdTaskSwiftUI
//
//  Created by Dmytro Ostrovka on 30.11.2023.
//

import SwiftUI

struct SortingVisualizationView: View {
    
    // MARK: - Properties
    var sortingStep: SortingStep
    var algorithm: SortingAlgorithm

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(sortingStep.array.indices, id: \.self) { index in
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(height: geometry.size.height / CGFloat(sortingStep.array.max() ?? 1) * CGFloat(sortingStep.array[index]))
                            .foregroundColor(colorForIndex(index))
                        if sortingStep.array.count < 20 {
                            Text("\(sortingStep.array[index])")
                                .font(.caption)
                        }
                    }
                }
            }
        }
        .animation(.easeInOut, value: sortingStep.array)
    }

    // MARK: - Private methods
    private func colorForIndex(_ index: Int) -> Color {
        switch algorithm {
        case .bubbleSort:
            return sortingStep.comparedIndices?.0 == index || sortingStep.comparedIndices?.1 == index ? .red : .blue
        case .mergeSort:
            if let range = sortingStep.currentMergeRange, range.contains(index) {
                return .green
            } else {
                return .blue
            }
        }
    }
}

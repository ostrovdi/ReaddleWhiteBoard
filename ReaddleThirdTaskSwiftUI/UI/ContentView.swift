//
//  ContentView.swift
//  ReaddleThirdTaskSwiftUI
//
//  Created by Dmytro Ostrovka on 30.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel = SortingViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack {
            VStack {
                Picker("Sorting Algorithm", selection: $viewModel.selectedAlgorithm) {
                    Text("Bubble Sort").tag(SortingAlgorithm.bubbleSort)
                    Text("Merge Sort").tag(SortingAlgorithm.mergeSort)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Enter numbers (e.g., 5,3,8,1)", text: $viewModel.arrayInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Generate") {
                        viewModel.generateLargeDataSet()
                    }
                    Button("Start") {
                        viewModel.startSorting()
                    }
                    Button("Step Back") {
                        viewModel.stepBackward()
                    }
                    Button("Step Forward") {
                        viewModel.stepForward()
                    }
                }
                
                if !viewModel.sortingSteps.isEmpty {
                    SortingVisualizationView(sortingStep: viewModel.sortingSteps[viewModel.currentStepIndex], 
                                             algorithm: viewModel.selectedAlgorithm)
                    
                    VStack {
                        Text(viewModel.isSortingComplete ? "Sorting Complete!" : "Sorting in Progress")
                            .font(.headline)
                            .padding()
                        Text("Time Elapsed: \(viewModel.elapsedTime)")
                    }
                }
            }
        }
    }
}
    
// MARK: - Preview
#Preview {
    ContentView()
}

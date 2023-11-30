//
//  BubbleSort.swift
//  ReaddleThirdTaskSwiftUI
//
//  Created by Dmytro Ostrovka on 30.11.2023.
//

import Foundation

final class BubbleSort {
    
    static func sortSteps(for array: [Int]) -> [SortingStep] {
        var steps = [SortingStep]()
        var a = array

        for i in 0..<a.count {
            var swapped = false

            for j in 0..<a.count - i - 1 {
                steps.append(SortingStep(array: a, comparedIndices: (j, j + 1)))

                if a[j] > a[j + 1] {
                    a.swapAt(j, j + 1)
                    swapped = true
                    steps.append(SortingStep(array: a, comparedIndices: (j, j + 1)))
                }
            }

            if !swapped {
                break
            }
        }

        steps.append(SortingStep(array: a, comparedIndices: nil))

        return steps
    }
}

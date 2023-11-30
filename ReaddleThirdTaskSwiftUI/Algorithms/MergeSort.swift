//
//  MergeSort.swift
//  ReaddleThirdTaskSwiftUI
//
//  Created by Dmytro Ostrovka on 30.11.2023.
//

import Foundation

final class MergeSort {
    
    static func sortSteps(for array: [Int]) -> [SortingStep] {
        var steps = [SortingStep]()
        var auxArray = array
        mergeSort(&auxArray, 0, array.count - 1, &steps)
        return steps
    }

    private static func mergeSort(_ array: inout [Int], _ start: Int, _ end: Int, _ steps: inout [SortingStep]) {
        if start < end {
            let middle = start + (end - start) / 2
            mergeSort(&array, start, middle, &steps)
            mergeSort(&array, middle + 1, end, &steps)
            merge(&array, start, middle, end, &steps)
        }
    }

    private static func merge(_ array: inout [Int], _ start: Int, _ middle: Int, _ end: Int, _ steps: inout [SortingStep]) {
        let leftArray = Array(array[start...middle])
        let rightArray = Array(array[(middle + 1)...end])

        var i = 0
        var j = 0
        var k = start

        while i < leftArray.count && j < rightArray.count {
            if leftArray[i] < rightArray[j] {
                array[k] = leftArray[i]
                i += 1
            } else {
                array[k] = rightArray[j]
                j += 1
            }
            steps.append(SortingStep(array: array, comparedIndices: (start + i, middle + j), currentMergeRange: start..<end+1))
            k += 1
        }

        while i < leftArray.count {
            array[k] = leftArray[i]
            steps.append(SortingStep(array: array, comparedIndices: nil, currentMergeRange: start..<end+1))
            i += 1
            k += 1
        }

        while j < rightArray.count {
            array[k] = rightArray[j]
            steps.append(SortingStep(array: array, comparedIndices: nil, currentMergeRange: start..<end+1))
            j += 1
            k += 1
        }
    }
}

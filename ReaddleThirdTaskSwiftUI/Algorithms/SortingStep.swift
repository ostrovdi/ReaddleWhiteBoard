//
//  SortingStep.swift
//  ReaddleThirdTaskSwiftUI
//
//  Created by Dmytro Ostrovka on 30.11.2023.
//

import Foundation

struct SortingStep {
    var array: [Int]
    var comparedIndices: (Int, Int)?
    var currentMergeRange: Range<Int>?
}

//
//  calculatorBrain.swift
//  Calculator
//
//  Created by jacob n johar on 04/10/20.
//  Copyright © 2020 Jacob johar. All rights reserved.
//

import Foundation
struct calculatorBrain {
    private var Items: [Double] = []
    
    mutating func pushItem(_ element: Double) {
        Items.append(element)
        print(element)
    }
    
    mutating func popItem() -> Double? {
        return Items.popLast()
    }
    
}

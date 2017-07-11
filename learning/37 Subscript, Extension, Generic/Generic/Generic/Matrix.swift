//
//  Matrix.swift
//  Generic
//
//  Created by CLEE on 11/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

struct Matrix {
    var rows:Int
    var columns:Int
    
    var grid:[Double]
    
//    private var grade:[Double]
    
    init(rows:Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    subscript(row:Int, column:Int) -> Double {
        get {
            return grid[(row * columns) + column]
        }
        set {
            grid[(row * columns) + column] = newValue
        }
    }
}

//
//  Array2D.swift
//  Cookie Crunch
//
//  Created by jeremy on 3/3/16.
//  Copyright © 2016 Indicane. All rights reserved.
//

//Creates a 2D array, used to make "towers" and "tiles"

struct Array2D<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows*columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row*columns + column]
        }
        set {
            array[row*columns + column] = newValue
        }
    }
}

//
//  level.swift
//  TD_grid _test_1
//
//  Created by ryan on 4/12/16.
//  Copyright © 2016 Indicane. All rights reserved.
//

import Foundation


let NumColumns = 32
let NumRows = 24

class Level {
    
    private var towers = Array2D<Tower>(columns: NumColumns, rows: NumRows)
    private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    func towerAtColumn(column: Int, row: Int) -> Tower? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return towers[column, row]
    }
    
    
    init(filename: String) {
        
        // 1
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            // 2
            if let tilesArray: AnyObject = dictionary["tiles"] {
                // 3
                for (row, rowArray) in (tilesArray as! [[Int]]).enumerate() {
                    // 4
                    let tileRow = NumRows - row - 1
                    // 5
                    for (column, value) in rowArray.enumerate() {
                        if value == 0 {
                            print("\(tiles[column, tileRow])")
                        }
                        if value == 1 { //A tower can be placed
                            tiles[column, tileRow] = Tile()
                        }
                        if value == 2 { //A tower can not be placed (Will switch to 0)
                            print("\(tiles[column, tileRow])")
                        }
                        if value == 3 {
                            
                        }
                        if value == 4 {
                            
                        }
                        if value == 5{
                            
                        }
                        if value == 6 {
                            
                        }
                    }
                }
            }
        }
    }
    
    func tileAtColumn(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    
    
    
    
    
}
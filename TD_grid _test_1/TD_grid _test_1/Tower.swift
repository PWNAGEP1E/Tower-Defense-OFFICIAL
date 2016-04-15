//
//  Cookie.swift
//  Cookie Crunch
//
//  Created by jeremy on 3/3/16.
//  Copyright © 2016 Indicane. All rights reserved.
//

//De cookied

import SpriteKit

enum TowerType: Int, CustomStringConvertible {
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    static func random() -> TowerType {
        return TowerType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    var description: String {
        return spriteName
    }
    var spriteName: String {//These names are the names of the image files
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"]
        
        return spriteNames[rawValue - 1]
        
    }
    
    var highlightedSpriteName: String {//This is the name of the highlighted image file (Might not be needed)
        return spriteName + "-Highlighted"
    }
}

class Tower: CustomStringConvertible, Hashable {
    var hashValue: Int {
        return row*10 + column
    }
    var description: String {
        return "type:\(towerType) square:(\(column),\(row))"
    }
    var column: Int
    var row: Int
    let towerType: TowerType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, towerType: TowerType) {
        self.column = column
        self.row = row
        self.towerType = towerType
    }
}
func ==(lhs: Tower, rhs: Tower) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}
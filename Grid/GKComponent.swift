//
//  GKComponent.swift
//  TowerDefenseV1
//
//  Created by jeremy on 3/31/16.
//  Copyright © 2016 Indicane. All rights reserved.
//

import SpriteKit
import GameplayKit



var scene: GameScene!
var sprite: SKSpriteNode!
var coordinate: int2!

init(scene: GameScene, sprite: SKSpriteNode, coordinate: int2) {
    self.scene = scene
    self.sprite = sprite
    self.coordinate = coordinate
}
//
//  GameScene.swift
//  TD_grid _test_1
//
//  Created by ryan on 4/12/16.
//  Copyright (c) 2016 Indicane. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var level: Level!
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 32.0
    let tilesLayer = SKNode()
    let gameLayer = SKNode()
    let towersLayer = SKNode()
    var selectionSprite = SKSpriteNode()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        let background = SKSpriteNode(imageNamed: "Background") //Load The background
        
        addChild(background)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth * CGFloat(NumColumns) / 2,
            y: -TileHeight * CGFloat(NumRows) / 2)
        
        tilesLayer.position = layerPosition
        gameLayer.addChild(tilesLayer)
        
        towersLayer.position = layerPosition
        gameLayer.addChild(towersLayer)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    
    func addSpritesForTowers(towers: Set<Tower>) {//Change name from addSpritesForCookies to addSpritesForTowers
        for tower in towers {
            let sprite = SKSpriteNode(imageNamed: tower.towerType.spriteName)
            sprite.position = pointForColumn(tower.column, row:tower.row)
            towersLayer.addChild(sprite)
            tower.sprite = sprite
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint { //Turns a column point into a CGPoint
        return CGPoint(
            x: CGFloat(column)*TileWidth + TileWidth/2,
            y: CGFloat(row)*TileHeight + TileHeight/2)
    }
    
    func addTiles() { //Adds images to all tile spots
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let tile = level.tileAtColumn(column, row: row) {
                    let tileNode = SKSpriteNode(imageNamed: "Tile")
                    tileNode.position = pointForColumn(column, row: row)
                    tilesLayer.addChild(tileNode)
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        let location = touch.locationInNode(towersLayer)
        let (success, column, row) = convertPoint(location)
        if success {
            if let tower = level.towerAtColumn(column, row: row) {
            }
        }
        
    }
    
    func convertPoint(point: CGPoint) -> (success: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns)*TileWidth &&
            point.y >= 0 && point.y < CGFloat(NumRows)*TileHeight {
                return (true, Int(point.x / TileWidth), Int(point.y / TileHeight))
        } else {
            return (false, 0, 0)  // invalid location
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // If swipeFromColumn is nil then either the swipe began outside
        // the valid area or the game has already swapped the cookies and we need
        // to ignore the rest of the motion.
        
        let touch = touches.first as UITouch!
        let location = touch.locationInNode(towersLayer)
        
        let (success, column, row) = convertPoint(location)
        if success {
            
            // Figure out in which direction the player swiped. Diagonal swipes
            // are not allowed.
            var horzDelta = 0, vertDelta = 0
            
            // Only try swapping when the user swiped into a new square.
            if horzDelta != 0 || vertDelta != 0 {
               
                hideSelectionIndicator()
                // Ignore the rest of this swipe motion from now on.
                
            }
        }
        
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if selectionSprite.parent != nil{
            hideSelectionIndicator()
        }
    }


    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touchesEnded(touches!, withEvent: event)
    }

    func showSelectionIndicatorForTower(tower: Tower) {//Change name from showSelectionIndicatorForCookie to showSelectionIndicatorForTower
        if selectionSprite.parent != nil {
            selectionSprite.removeFromParent()
        }
    
        if let sprite = tower.sprite {
            let texture = SKTexture(imageNamed: tower.towerType.highlightedSpriteName)
            selectionSprite.size = texture.size()
            selectionSprite.runAction(SKAction.setTexture(texture))
        
            sprite.addChild(selectionSprite)
            selectionSprite.alpha = 1.0
        }
    }
    func hideSelectionIndicator() {
        selectionSprite.runAction(SKAction.sequence([
            SKAction.fadeOutWithDuration(0.3),
            SKAction.removeFromParent()]))
    }









}

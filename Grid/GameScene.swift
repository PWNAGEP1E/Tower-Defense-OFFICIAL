//
//  Tower_Defense.swift
//  
//  RYAN DID NOTHING
//  Created by jeremy on 3/28/16.
//  Copyright (c) 2016 Indicane. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var width: CGFloat!
    var height: CGFloat = 24
    var boxSize: CGFloat!
    var gridStart: CGPoint!
    var gridPoint: int2?
    
    
    override func didMoveToView(view: SKView) {
        createGrid()
    }
    
   
    override func update(currentTime: CFTimeInterval) {
    }
    
    func createGrid() {
        let grid = SKNode() // create a node to hold all grid squares
        
        let usableWidth = size.width * 1 // we only want to use 90% of the width available
        let usableHeight = size.height * 1 // we only want to use 80% of the height available
        
        boxSize = usableHeight / height // calculate the box size based on requested height
        
        width = CGFloat(Int(usableWidth / boxSize)) // calculate number of boxes along the x axis based on boxSize
        
        let offsetX = (size.width - boxSize * width) / 2 // used to center the grid horizontally
        let offsetY = (size.height - boxSize * height) / 2 // used to center the grid vertically
        
        // loop through the entire grid
        for col in 0 ..< Int(width) {
            for row in 0 ..< Int(height) {
                let path = UIBezierPath(rect: CGRect(x: boxSize * CGFloat(col), y: boxSize * CGFloat(row), width: boxSize, height: boxSize))
                let box = SKShapeNode(path: path.CGPath)
                box.strokeColor = UIColor.grayColor()
                box.alpha = 0.3
                grid.addChild(box)                  }
        }
        
        gridStart = CGPointMake(offsetX, offsetY) // set gridStart for later use
        grid.position = CGPointMake(offsetX, offsetY) // set the grid position, centered in view
        addChild(grid) // add the grid to the scene
    }

    
    
    func convertToGrid(location: CGPoint)-> int2{ //Converts a CGPoint to a int2 (Grid position)
        return int2(Int32((location.x - gridStart.x) / boxSize), Int32((location.y - gridStart.y) / boxSize))
    }
    
    
    
    func playerHasInteracted(location: CGPoint){ //The function to do stuff with a player touch
        gridPoint = convertToGrid(location)
        print("\(gridPoint)")
    }
    
    
    
    
    func playerTapp(location: CGPoint){  //Detects a tap, only give cordinates once
        playerHasInteracted(location)
    }
    
    func playerSwipe(location: CGPoint){ //Detects a moving touch, constantly runs with the cordinates
        playerHasInteracted(location)
    }
    
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { //Gets the location of a touch as a UITouch
            return
        }
        let touchLocation = touch.locationInNode(self)//Converts UITouch into a CGPoint
        playerTapp(touchLocation)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { //Gets the location of a swipe as a UITouch
            return
        }
        let touchLocation = touch.locationInNode(self)//Converts UITouch into a CGPoint
        playerSwipe(touchLocation)
    }

}

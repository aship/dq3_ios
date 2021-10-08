//
//  BaseScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class BaseScene: SKScene {
    let scale = CGFloat(ScreenHeight / 240)
    
    let leftPad = PadOverlay()
    let buttonA = ButtonOverlay("A")
    let buttonB = ButtonOverlay("B")
    
    var padDirection: Direction = .neutral
    
    var triangleNode = SKSpriteNode()
    
    var queueFollowDirections: [Direction] = []
    var characterNpcNodes: [CharacterNode] = []
    
    override func sceneDidLoad() {
        self.scaleMode = .resizeFill
        self.anchorPoint = CGPoint(x: 0.5,
                                   y: 0.5)
    }
}

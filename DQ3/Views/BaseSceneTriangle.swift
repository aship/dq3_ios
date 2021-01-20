//
//  BaseSceneTriangle.swift
//  DQ3
//
//  Created by aship on 2021/01/19.
//

import SpriteKit

extension BaseScene {
    func pauseTriangleAnimation(triangleNode: SKSpriteNode) {
        triangleNode.isPaused = true
        triangleNode.texture = SKTexture(imageNamed: "font/symbol/triangle_right")
    }
    
    func addTriangle(windowNode: SKTileMapNode,
                     triangleNode: inout SKSpriteNode,
                     pointX: Int,
                     pointY: Int) {
        let imageName1 = "font/symbol/triangle_right"
        let texture1 = SKTexture(imageNamed: imageName1)
        
        let imageName2 = "font/window/space"
        let texture2 = SKTexture(imageNamed: imageName2)
        
        let textures = [texture1, texture2]
        
        let action = SKAction.animate(with: textures,
                                      timePerFrame: 1 / 4)
        
        let repeatAction = SKAction.repeatForever(action)
        
        triangleNode = DQFont.getFont(string: "▶︎")
        triangleNode.position = CGPoint(x: pointX,
                                        y: pointY)
        triangleNode.run(repeatAction)
        windowNode.addChild(triangleNode)
    }
}

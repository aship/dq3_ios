//
//  Triangle.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

func pauseTriangleAnimation(triangleNode: SKSpriteNode) {
    let imageName = "font/symbol/triangle_right"
    
    triangleNode.isPaused = true
    triangleNode.texture = SKTexture(imageNamed: imageName)
}

func addTriangle(pointX: Int,
                 pointY: Int,
                 triangleNode: inout SKSpriteNode,
                 windowNode: SKTileMapNode) {
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

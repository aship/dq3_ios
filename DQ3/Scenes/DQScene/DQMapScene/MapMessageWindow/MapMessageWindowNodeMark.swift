//
//  MapMessageWindowNodeMark.swift
//  DQ3
//
//  Created by aship on 2021/05/12.
//

import SpriteKit

extension MapMessageWindowNode {
    internal func showNextMark(line: Int) {
        let BaseX = 8
        let BaseY = -24 - 16 * line
        let index = 9
        
        self.nextMark = DQFont.getFont(string: "▼")
        self.nextMark.position = CGPoint(x: BaseX + 8 * index,
                                         y: BaseY)
        
        self.addChild(self.nextMark)
        
        let imageName1 = "font/symbol/triangle_down"
        let texture1 = SKTexture(imageNamed: imageName1)
        
        let imageName2 = "font/window/space"
        let texture2 = SKTexture(imageNamed: imageName2)
        
        let textures = [texture1, texture2]
        
        let action = SKAction.animate(with: textures,
                                      timePerFrame: 1 / 4)
        
        let repeatAction = SKAction.repeatForever(action)
        
        self.nextMark.run(repeatAction)
    }
}

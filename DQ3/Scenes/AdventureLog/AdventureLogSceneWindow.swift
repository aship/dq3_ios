//
//  AdventureLogSceneWindow.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func addWindow(windowNode: SKSpriteNode,
                   scale: CGFloat) {
        // 左上基準
        windowNode.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        
        let pointX: CGFloat = (-128 + 48) * scale
        let pointY: CGFloat = (112 - 56) * scale
        
        windowNode.setScale(scale)
        windowNode.position = CGPoint(x: pointX, y: pointY)
        
        self.addChild(windowNode)
    }
}

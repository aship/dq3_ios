//
//  BattleSceneCommand.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addCommandWindow(node: SKSpriteNode,
                          scale: CGFloat) {
        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        let pointX: CGFloat = (-128 + 32) * scale
        let pointY: CGFloat = (-112 + 8) * scale
        
        node.setScale(scale)
        node.isHidden = true
        node.position = CGPoint(x: pointX, y: pointY)
        
        self.addChild(node)
    }
}

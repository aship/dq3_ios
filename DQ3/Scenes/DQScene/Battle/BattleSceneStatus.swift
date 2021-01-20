//
//  BattleSceneStatus.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addStatusWindow(node: SKSpriteNode,
                         scale: CGFloat) {
        // 左上基準
        node.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        node.setScale(scale)
        node.isHidden = true
        
        let pointX: CGFloat = (-128 + 32) * scale
        let pointY: CGFloat = (112 - 8) * scale
        
        node.position = CGPoint(x: pointX, y: pointY)
        
        self.scene.addChild(node)
    }
}

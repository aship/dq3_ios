//
//  BattleSceneTarget.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addTargetWindow(node: SKSpriteNode,
                         scale: CGFloat) {
        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        let pointX: CGFloat = (-128 + 96) * scale
        let pointY: CGFloat = (-112 + 40) * scale
        
        node.position = CGPoint(x: pointX, y: pointY)
        node.setScale(scale)
        node.isHidden = true
        
        self.addChild(node)
    }
}

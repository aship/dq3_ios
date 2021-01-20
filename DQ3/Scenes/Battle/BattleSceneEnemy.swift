//
//  BattleSceneEnemy.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addEnemy(node: SKSpriteNode,
                  scale: CGFloat) {
        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        let pointX: CGFloat = -30 * scale
        let pointY: CGFloat = -16 * scale
        
        node.setScale(scale)
        node.position = CGPoint(x: pointX, y: pointY)
        
        self.scene.addChild(node)
    }
    
    func addEnemy2(node: SKSpriteNode,
                   scale: CGFloat) {
        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        node.setScale(scale)
        
        let pointX: CGFloat = 0 * scale
        let pointY: CGFloat = -16 * scale
        
        node.position = CGPoint(x: pointX, y: pointY)
        
        self.scene.addChild(node)
    }
}

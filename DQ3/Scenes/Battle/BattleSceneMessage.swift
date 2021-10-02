//
//  BattleSceneMessage.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addMessageWindow(windowNode: SKSpriteNode,
                          labelNode: SKLabelNode,
                          scale: CGFloat) {
        // 左下基準
        windowNode.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        let pointX: CGFloat = (-128 + 32) * scale
        let pointY: CGFloat = (-112 + 8) * scale
        
        windowNode.setScale(scale)
        windowNode.position = CGPoint(x: pointX, y: pointY)
        
        self.addChild(windowNode)
        
        labelNode.text = "スライムが　あらわれた！\nいっかくうさぎが　あらわれた！"
        labelNode.horizontalAlignmentMode = .left
        labelNode.verticalAlignmentMode = .top
        labelNode.fontSize = 7.5
        labelNode.numberOfLines = 2
        labelNode.position = CGPoint(x: 6, y: 68)
        
        windowNode.addChild(labelNode)
    }
}

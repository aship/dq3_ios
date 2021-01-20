//
//  OpeningSceneMessage.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension OpeningScene {
    func showMessage(text: String,
                     numberOfLine: Int) {
        self.messageWindowNode.isHidden = false
        
        self.labelNode.text = text
        self.labelNode.numberOfLines = numberOfLine
    }
    
    func hideMessageWindow() {
        self.messageWindowNode.isHidden = true
    }
    
    func addMessageWindow(node: SKSpriteNode,
                          labelNode: SKLabelNode,
                          scale: CGFloat) {
        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        let posX: CGFloat = (-128 + 48) * self.scale
        let posY: CGFloat = (-112 + 8) * self.scale
        
        node.position = CGPoint(x: posX, y: posY)
        node.setScale(self.scale)
        node.isHidden = true
        node.zPosition = 9
        
        self.addChild(node)
        
        labelNode.text = "そのほうこうには　だれもいない。"
        labelNode.horizontalAlignmentMode = .left
        labelNode.verticalAlignmentMode = .top
        labelNode.fontSize = 7.5
        labelNode.numberOfLines = 1
        labelNode.position = CGPoint(x: 6, y: 68)
        
        node.addChild(labelNode)
    }
}

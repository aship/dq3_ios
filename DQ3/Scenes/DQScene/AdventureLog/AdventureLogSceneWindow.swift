//
//  AdventureLogSceneWindow.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func hideMessageWindow() {
        self.windowNode.isHidden = true
    }
    
    func addWindow(scale: CGFloat) {
        // 左上基準
        self.windowNode.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        
        let posX: CGFloat = (-128 + 48) * scale
        let posY: CGFloat = (112 - 56) * scale
        
        self.windowNode.setScale(scale)
        self.windowNode.position = CGPoint(x: posX, y: posY)
        
        self.scene.addChild(self.windowNode)
    }
}

//
//  TalkMessageWindowAliahanTownMark.swift
//  DQ3
//
//  Created by aship on 2021/01/29.
//

import SpriteKit

extension TalkMessageWindowAliahanTown {
    func moveLine() {
        // 全体を一つ上にずらす
        for line in self.arrLines {
            for letter in line {
                let action = SKAction.moveBy(x: 0,
                                             y: 16,
                                             duration: 0)
                letter.run(action)
            }
        }
        
        // 最初の行を消す
        let lastLine = self.arrLines.first!
        
        for letter in lastLine {
            letter.removeFromParent()
        }
        
        self.arrLines.removeFirst()
    }
    
    func showNextMark(line: Int) {
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

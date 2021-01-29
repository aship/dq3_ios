//
//  MapMessageWindowNodeShow.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension MapMessageWindowNode {
    func showMessage(string: String,
                     line: Int,
                     withSe: Bool,
                     completion: @escaping () -> Void) {
        let BaseX = 8
        let BaseY = -24 - 16 * line
        
        if withSe {
            SoundEffectManager.play(.message)
        }
        
        var actions: [SKAction] = []
        
        for (index, word) in string.enumerated() {
            let node = DQFont.getFont(string: String(word))
            node.position = CGPoint(x: BaseX + 8 * index,
                                    y: BaseY)
            
            node.alpha = 0
            self.addChild(node)
            
            let actionFaceIn = SKAction.run({
                node.alpha = 1
            })
            
            let actionWait = SKAction.wait(forDuration: 1 / 32)
            
            actions.append(actionFaceIn)
            actions.append(actionWait)
        }
        
        let sequence = SKAction.sequence(actions)
        
        self.run(sequence,
                 completion: {
                    completion()
                 })
    }
    
    func showNextMark(line: Int,
                      completion: @escaping () -> Void) {
        self.showMessage(string: "　　　　　　　　　▼",
                         line: line,
                         withSe: false,
                         completion: {
                            completion()
                         })
    }
}

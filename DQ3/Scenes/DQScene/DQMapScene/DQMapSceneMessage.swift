//
//  DQMapSceneMessage.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension DQMapScene {
    func closeMessageWindow(messageWindowNode: SKTileMapNode,
                            isMessageWindowOpen: inout Bool) {
        messageWindowNode.removeFromParent()
        isMessageWindowOpen = false
    }
    
    func addMessageWindow(messageWindowNode: inout SKTileMapNode,
                          isMessageWindowOpen: inout Bool,
                          scale: CGFloat) {
        messageWindowNode.removeFromParent()
        
        // x: 48, y: 136 は左上(0, 0)基準
        let pointX = -128 + 48
        let pointY = 112 - 136
        
        messageWindowNode = generateWindow(pointX: pointX,
                                           pointY: pointY,
                                           numberOfColumns: 20,
                                           numberOfRows: 10,
                                           scale: scale)
        
        messageWindowNode.zPosition = ZPositionWindow
        self.scene.addChild(messageWindowNode)
        
        isMessageWindowOpen = true
    }
    
    func showMessage(string: String,
                     line: Int,
                     withSe: Bool,
                     messageWindowNode: SKTileMapNode,
                     completion: @escaping () -> Void) {
        let BaseX = 8
        let BaseY = -24 - 16 * line
        
        if withSe {
            self.scene.playSoundEffect(.message)
        }
        
        var actions: [SKAction] = []
        
        for (index, word) in string.enumerated() {
            let node = DQFont.getFont(string: String(word))
            node.position = CGPoint(x: BaseX + 8 * index,
                                    y: BaseY)
            
            node.alpha = 0
            messageWindowNode.addChild(node)
            
            let actionFaceIn = SKAction.run({
                node.alpha = 1
            })
            
            let actionWait = SKAction.wait(forDuration: 1 / 32)
            
            actions.append(actionFaceIn)
            actions.append(actionWait)
        }
        
        let sequence = SKAction.sequence(actions)
        
        self.scene.run(sequence,
                       completion: {
                        completion()
                       })
    }
    
    func showNextMark(line: Int,
                      messageWindowNode: SKTileMapNode,
                      completion: @escaping () -> Void) {
        self.showMessage(string: "　　　　　　　　　▼",
                         line: line,
                         withSe: false,
                         messageWindowNode: messageWindowNode,
                         completion: {
                            completion()
                         })
    }
}

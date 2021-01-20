//
//  DQMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonA(commandWindowNode: inout SKTileMapNode,
                        messageWindowNode: inout SKTileMapNode,
                        triangleNode: SKSpriteNode,
                        isCommandWindowOpen: inout Bool,
                        isMessageWindowOpen: inout Bool,
                        scale: CGFloat) {
        let headNode = DataManager.characterNodes.first!
        
        if isCommandWindowOpen &&
            isMessageWindowOpen {
            // 閉じる時
            headNode.setMovePermitted()
            
            for node in DataManager.characterNodes {
                node.isPaused = false
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = false
            }
            
            closeCommandWindow(commandWindowNode: commandWindowNode,
                               isCommandWindowOpen: &isCommandWindowOpen)
            closeMessageWindow(messageWindowNode: messageWindowNode,
                               isMessageWindowOpen: &isMessageWindowOpen)
        }
        else if !isCommandWindowOpen {
            // コマンドウィンドウ表示
            self.scene.playSoundEffect(.command)
            
            headNode.setMoveProhibited()
            
            for node in DataManager.characterNodes {
                node.isPaused = true
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = true
            }
            
            addCommandWindow(commandWindowNode: &commandWindowNode,
                             isCommandWindowOpen: &self.isCommandWindowOpen,
                             scale: scale)
        }
        else {
            // 「はなす」でAボタンを押した
            self.scene.playSoundEffect(.command)
            
            self.scene.pauseTriangleAnimation(triangleNode: triangleNode)
            
            let text1 = "そのほうこうには　だれも　いない。"
            
            showMessages(text1: text1,
                         text2: nil,
                         text3: nil,
                         withSe: false,
                         withNextMark: false,
                         messageWindowNode: &messageWindowNode,
                         isMessageWindowOpen: &isMessageWindowOpen,
                         scale: scale,
                         completion: {})
        }
    }
}

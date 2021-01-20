//
//  DQMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonA(processTalk: ProcessTalk,
                        commandWindowNode: inout SKTileMapNode,
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
                             isCommandWindowOpen: &isCommandWindowOpen,
                             scale: scale)
        }
        else {
            // 「はなす」でAボタンを押した
            self.scene.playSoundEffect(.command)
            
            self.scene.pauseTriangleAnimation(triangleNode: triangleNode)
            
            let values = processTalk(headNode)
            let withSe = values.0
            let text1 = values.1
            let text2 = values.2
            let text3 = values.3
            
            showMessages(text1: text1,
                         text2: text2,
                         text3: text3,
                         withSe: withSe,
                         withNextMark: false,
                         messageWindowNode: &messageWindowNode,
                         isMessageWindowOpen: &isMessageWindowOpen,
                         scale: scale,
                         completion: {})
        }
    }
}

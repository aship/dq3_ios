//
//  BaseMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension BaseMapScene {
    func processButtonA(commandWindowNode: inout SKTileMapNode,
                        messageWindowNode: inout SKTileMapNode,
                        triangleNode: SKSpriteNode,
                        isCommandWindowOpen: inout Bool,
                        isMessageWindowOpen: inout Bool,
                        scale: CGFloat) {
        if isCommandWindowOpen &&
            isMessageWindowOpen {
            // 閉じる時
            setMovePermitted()
            
            closeCommandWindow(commandWindowNode: commandWindowNode,
                               isCommandWindowOpen: &isCommandWindowOpen)
            closeMessageWindow(messageWindowNode: messageWindowNode,
                               isMessageWindowOpen: &isMessageWindowOpen)
        }
        else if !isCommandWindowOpen {
            // コマンドウィンドウ表示
            playSoundEffect(.command)
            setMoveProhibited()
            
            addCommandWindow(commandWindowNode: &commandWindowNode,
                             isCommandWindowOpen: &isCommandWindowOpen,
                             scale: scale)
        }
        else {
            // 「はなす」でAボタンを押した
            playSoundEffect(.command)
            
            pauseTriangleAnimation(triangleNode: triangleNode)
            
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

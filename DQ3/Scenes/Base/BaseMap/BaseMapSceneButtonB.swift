//
//  BaseMapSceneButtonB.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension BaseMapScene {
    func processButtonB(commandWindowNode: SKTileMapNode,
                        messageWindowNode: SKTileMapNode,
                        isCommandWindowOpen: inout Bool,
                        isMessageWindowOpen: inout Bool) {
        if isCommandWindowOpen {
            // 閉じる時
            setMovePermitted()
            
            closeCommandWindow(commandWindowNode: commandWindowNode,
                               isCommandWindowOpen: &isCommandWindowOpen)
            closeMessageWindow(messageWindowNode: messageWindowNode,
                               isMessageWindowOpen: &isMessageWindowOpen)
        }
    }
}

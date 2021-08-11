//
//  BaseMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension BaseMapScene {
    func processButtonA(mapCommandWindowNode: inout MapCommandWindowNode,
                        mapMessageWindowNode: inout MapMessageWindowNode,
                        scale: CGFloat) {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        
        if mapCommandWindowNode.isOpen {
            // コマンド処理中
            let shouldClose = mapCommandWindowNode.processButtonA()
            
            if shouldClose {
                headNode.setMovePermitted()
            }
            
            return
        }
        
        // コマンドウィンドウ表示
        SoundEffectManager.play(.command)
        
        headNode.setMoveProhibited()
        
        mapCommandWindowNode = MapCommandWindowNode()
        mapCommandWindowNode.addToScene(scene: self,
                                        scale: self.scale)
    }
}

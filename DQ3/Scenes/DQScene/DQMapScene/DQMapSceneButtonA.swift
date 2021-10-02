//
//  DQMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonA(mapCommandWindowNode: inout MapCommandWindowNode,
                        mapMessageWindowNode: MapMessageWindowNode,
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
        mapCommandWindowNode.addToScene(scene: self.scene,
                                        scale: self.scene.scale)
    }
}

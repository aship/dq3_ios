//
//  DQMapSceneButtonB.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonB(mapCommandWindowNode: MapCommandWindowNode,
                        mapMessageWindowNode: MapMessageWindowNode) {
        if mapCommandWindowNode.isOpen {
            // 閉じる時
            let headNode = DataManager.characterNodes.first!
            headNode.setMovePermitted()
            
            for node in DataManager.characterNodes {
                node.isPaused = false
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = false
            }
            
            mapCommandWindowNode.close()
            mapMessageWindowNode.close()
        }
    }
}

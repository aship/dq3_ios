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
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        
        if mapCommandWindowNode.isOpen {
            headNode.setMovePermitted()
            mapCommandWindowNode.close()
            
            return
        }
        
        if mapMessageWindowNode.isOpen {
            headNode.setMovePermitted()
            mapMessageWindowNode.close()
        }
    }
}

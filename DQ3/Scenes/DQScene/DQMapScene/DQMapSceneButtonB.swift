//
//  DQMapSceneButtonB.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonB(mapCommandWindowNode: MapCommandWindowNode,
                        mapStatusWindowNode: MapStatusWindowNode,
                        mapMessageWindowNode: MapMessageWindowNode) {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes
        
        if mapCommandWindowNode.isOpen {
            headNode.setMovePermitted()
            mapCommandWindowNode.close()
            mapStatusWindowNode.close()
            
            for node in partyCharacterNodes {
                node.isPaused = false
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = false
            }
            
            return
        }
        
        if mapMessageWindowNode.isOpen {
            headNode.setMovePermitted()
            mapMessageWindowNode.close()
            mapStatusWindowNode.close()
            
            for node in partyCharacterNodes {
                node.isPaused = false
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = false
            }
        }
    }
}

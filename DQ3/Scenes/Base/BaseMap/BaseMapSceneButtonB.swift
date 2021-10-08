//
//  BaseMapSceneButtonB.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension BaseMapScene {
    func processButtonB(mapMessageWindowNode: MapMessageWindowNode) {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        
        if mapMessageWindowNode.isOpen {
            headNode.setMovePermitted()
            mapMessageWindowNode.close()
        }
    }
}

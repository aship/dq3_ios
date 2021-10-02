//
//  BaseMapSceneButtonB.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension BaseMapScene {
    func processButtonB(mapCommandWindowNode: MapCommandWindowNode,
                        mapMessageWindowNode: MapMessageWindowNode) {
        if mapCommandWindowNode.isOpen {
            setMovePermitted()
            mapCommandWindowNode.close()
            
            return
        }
        
        if mapMessageWindowNode.isOpen {
            setMovePermitted()
            mapMessageWindowNode.close()
        }
    }
}

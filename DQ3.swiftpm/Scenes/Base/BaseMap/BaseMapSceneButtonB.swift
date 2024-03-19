//
//  BaseMapSceneButtonB.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension BaseMapScene {
    func processButtonB(mapMessageWindowNode: MapMessageWindowNode) {
        if mapMessageWindowNode.isOpen {
            setMovePermitted()
            mapMessageWindowNode.close()
        }
    }
}

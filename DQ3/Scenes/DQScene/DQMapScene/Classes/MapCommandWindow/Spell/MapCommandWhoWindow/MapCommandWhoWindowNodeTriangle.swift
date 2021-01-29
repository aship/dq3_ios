//
//  MapCommandWhoWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

extension MapCommandWhoWindowNode {
    func moveTriangle(direction: Direction) {
        if self.mapCommandSpellWindowNode.isOpen {
            self.mapCommandSpellWindowNode.moveTriangle(direction: direction)
            
            return
        }
    }
}

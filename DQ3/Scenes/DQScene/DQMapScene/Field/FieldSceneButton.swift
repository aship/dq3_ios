//
//  FieldSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/29.
//

import SpriteKit

extension FieldScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode,
                           scale: self.scene.scale)
        }
        else if button == self.scene.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

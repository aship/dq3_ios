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
            processButtonA()
        } else if button == self.scene.buttonB {
            processButtonB(mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

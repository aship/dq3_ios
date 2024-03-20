//
//  AdventureLogScenePad.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            self.adventureLogTopWindowNode?.processButtonA()
        }
    }
}

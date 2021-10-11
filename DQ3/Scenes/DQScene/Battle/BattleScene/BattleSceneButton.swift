//
//  BattleSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            if self.battleCommandWindowNode.isOpen {
                self.battleCommandWindowNode.processButtonA()
                
                return
            }
            
            if self.battleMessageWindowNode.isOpen {
                self.battleMessageWindowNode.processButtonA()
                
                return
            }
        }
    }
}

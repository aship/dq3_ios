//
//  BattleGoldWIndowNodeButton.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

extension BattleGoldWindowNode {
    func processButtonA() {
        if !self.isProcessing {
            self.isProcessing = true
            
            let scene = self.parent!.parent as! BaseScene
            scene.transitionFromBattle()
        }
    }
}

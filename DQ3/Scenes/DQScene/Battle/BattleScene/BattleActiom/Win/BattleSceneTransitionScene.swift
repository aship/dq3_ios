//
//  BattleSceneTransitionScene.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func transitionScene() {
        let scene = self.scene!
        
        scene.transitionFromBattle()
    }
}

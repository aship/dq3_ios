//
//  BattleCommandWindowNodeFlee.swift
//  DQ3
//
//  Created by aship on 2021/08/11.
//

import SpriteKit

extension BattleCommandWindowNode {
    func processFlee() {
        let battleScene = self.battleScene!
        battleScene.battleCommandWindowNode.close()
        battleScene.battleTargetWindowNode.close()
        
        let text1 = "えにくすはにげだした!"
        
        battleScene.battleMessageWindowNode = BattleMessageWindowNode(battleScene: nil)
        
        let battleMessageWindowNode = battleScene.battleMessageWindowNode
        let scene = battleScene.scene!
        let scale = battleScene.scene.scale
        
        battleMessageWindowNode.addToScene(
            scene: scene,
            scale: scale)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            battleMessageWindowNode.showMessage(
                string: text1,
                line: 0)
            
            self.fleetTransition()
        }
    }
    
    private func fleetTransition() {
        let scene = self.battleScene.scene!
        
        scene.transitionFromBattle()
    }
}

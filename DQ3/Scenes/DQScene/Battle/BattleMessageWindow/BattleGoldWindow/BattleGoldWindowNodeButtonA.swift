//
//  BattleGoldWIndowNodeButton.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

extension BattleGoldWindowNode {
    func processButtonA() {
        let scene = self.parent!.parent as! BaseScene
        
        //   scene.transitionScene()
        
        
        if DataManager.dqSceneTypeFromBattle == .field {
            var dqAudio: DQAudio = .field
            
            if scene.fieldMoveMode == .ship {
                dqAudio = .ship
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                scene.transitionFromBattle(dqSceneType: .field)
            }
        }
        else if DataManager.dqSceneTypeFromBattle == .alefgard {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                scene.transitionFromBattle(dqSceneType: .alefgard)
            }
        }
    }
}

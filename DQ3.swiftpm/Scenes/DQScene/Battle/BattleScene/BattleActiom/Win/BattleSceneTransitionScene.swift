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

        if DataManager.dqSceneTypeFromBattle == .field {
            var dqAudio: DQAudio = .field

            if scene.fieldMoveMode == .ship {
                dqAudio = .ship
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                scene.transitionFromBattle(
                    dqSceneType: .field,
                    dqAudio: dqAudio)
            }
        } else if DataManager.dqSceneTypeFromBattle == .alefgard {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                scene.transitionFromBattle(
                    dqSceneType: .alefgard,
                    dqAudio: .alefgard)
            }
        }
    }
}

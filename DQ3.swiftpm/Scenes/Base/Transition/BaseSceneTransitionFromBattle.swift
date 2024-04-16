//
//  BaseSceneTransitionFromBattle.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension BaseScene {
    func transitionFromBattle() {
        let actionFadeOut = SKAction.fadeAlpha(
            to: 1.0,
            duration: 0.5)

        let actionFadeIn = SKAction.fadeAlpha(
            to: 0.0,
            duration: 0.5)
        Task {
            await self.blackScreenNode.run(actionFadeOut)

            let battleScene = self.getDQScene(dqSceneType: .battle) as! BattleScene
            battleScene.battleMessageWindowNode.close()
            battleScene.battleStatusWindowNode.close()
            battleScene.battleCommandWindowNode.close()
            battleScene.battleTargetWindowNode.close()

            // モンスターノードもremove
            for monsterGroup in battleScene.monsterGroups {
                for monsterNode in monsterGroup.monsterNodes {
                    monsterNode.removeFromParent()
                }
            }

            let dqSceneType = DataManager.dqSceneTypeFromBattle

            self.setupDQScene(
                dqMainState: nil,
                dqSceneType: dqSceneType)

            await self.blackScreenNode.run(actionFadeIn)
        }
    }
}

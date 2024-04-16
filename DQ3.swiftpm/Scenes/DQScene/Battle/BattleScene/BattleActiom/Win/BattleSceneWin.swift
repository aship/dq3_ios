//
//  BattleSceneWin.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func winMonster() async {
        await self.battleMessageWindowNode.close()

        let scene = self.scene!
        let scale = scene.scale

        await self.battleMessageWindowNode = BattleMessageWindowNode(battleScene: self)
        await self.battleMessageWindowNode.addToScene(
            scene: scene,
            scale: scale)

        await battleMessageWindowNode.showWinMessage()
    }
}

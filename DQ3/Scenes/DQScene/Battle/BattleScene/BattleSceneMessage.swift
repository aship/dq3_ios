//
//  BattleSceneMessage.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addMessageWindow(battleMessageWindowNode: inout BattleMessageWindowNode,
                          scene: BaseScene,
                          scale: CGFloat) {
        battleMessageWindowNode.close()
        battleMessageWindowNode = BattleMessageWindowNode()
        battleMessageWindowNode.addToScene(
            scene: scene,
            scale: scale)
    }
}

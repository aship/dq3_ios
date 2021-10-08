//
//  BattleSceneTarget.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addTargetWindow(battleTargetWindowNode: inout BattleTargetWindowNode,
                         monsterGroups: [MonsterGroup],
                         scene: BaseScene,
                         scale: CGFloat) {
        battleTargetWindowNode = BattleTargetWindowNode(battleScene: self,
                                                        monsterGroups: monsterGroups)
        battleTargetWindowNode.addToScene(scene: scene,
                                          scale: scale)
        battleTargetWindowNode.setTargets()
    }
}

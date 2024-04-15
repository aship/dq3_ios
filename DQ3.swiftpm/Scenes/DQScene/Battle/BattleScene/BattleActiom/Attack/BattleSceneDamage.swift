//
//  BattleSceneDamage.swift
//  DQ3
//
//  Created by aship on 2021/05/27.
//

import SpriteKit

extension BattleScene {
    func damageAction(monsterNode: MonsterNode) {
        let actionWait = SKAction.wait(forDuration: 1 / 16)
        let actions = SKAction.sequence([
            SKAction.hide(),
            actionWait,
            SKAction.unhide(),
            actionWait,
        ])
        let repeatAction = SKAction.repeat(actions, count: 4)

        monsterNode.run(repeatAction)
    }

    func showDamageMessage(
        monsterNode: MonsterNode,
        monsterIndexAlphabet: String
    ) {
        let damageMax = 10
        let damage = Int.random(in: 1...damageMax)

        monsterNode.setDamage(damage: damage)

        let dqMonsterType = monsterNode.dqMonsterType
        let monsterName = getDQMonsterTypeNameFrom(dqMonsterType: dqMonsterType)

        let text = "\(monsterName)\(monsterIndexAlphabet)に \(damage)のダメージ!"

        self.battleMessageWindowNode.showMessage(
            string: text,
            line: 1)
    }
}

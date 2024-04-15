//
//  BattleSceneDefeatMonster.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func defeatMonster(
        monsterNode: MonsterNode,
        monsterIndexAlphabet: String
    ) {
        let dqMonsterType = monsterNode.dqMonsterType
        let monsterName = getDQMonsterTypeNameFrom(dqMonsterType: dqMonsterType)

        let text = "\(monsterName)\(monsterIndexAlphabet)を たおした!"

        monsterNode.isHidden = true

        self.battleMessageWindowNode.showMessage(
            string: text,
            line: 2)
    }
}

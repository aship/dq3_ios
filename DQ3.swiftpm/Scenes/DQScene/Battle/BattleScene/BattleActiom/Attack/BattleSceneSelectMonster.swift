//
//  File.swift
//  DQ3
//
//  Created by aship on 2021/08/12.
//

import SpriteKit

extension BattleScene {
    func selectMonsterFromGroup() -> (MonsterNode, String) {
        // 選択したグループに攻撃する
        //        let dqMonsterType = monsterNode.dqMonsterType
        //        let monsterName = getDQMonsterTypeNameFrom(dqMonsterType: dqMonsterType)
        //
        //
        //   var targetIndex: Int!

        // グループを取得
        //        for group in self.monsterGroups {
        //            if group.dqMonsterType == dqMonsterType {
        //                monsterGroup = group
        //                break
        //            }
        //        }

        let monsterGroup = self.battleActionStruct.monsterGroup!
        let monsterNodes = monsterGroup.monsterNodes

        // グループのモンスター数
        let numberOfMonstersInGroup = monsterNodes.count

        var isTargetMonsterSearching = true
        var monsterNode: MonsterNode!
        var targetIndex: Int!

        while isTargetMonsterSearching {
            // どのモンスターにするか
            targetIndex = Int.random(in: 0..<numberOfMonstersInGroup)

            monsterNode = monsterNodes[targetIndex]

            if 0 < monsterNode.hp {
                // 生きてるモンスターが見つかったら
                // ループを抜ける
                isTargetMonsterSearching = false
            }
        }

        // グループの人数が1だったら ABC とかつけない
        var monsterIndexAlphabet = ""

        if 1 < monsterGroup.monsterNodes.count {
            switch targetIndex {
            case 0: monsterIndexAlphabet = "A"
            case 1: monsterIndexAlphabet = "B"
            case 2: monsterIndexAlphabet = "C"
            case 3: monsterIndexAlphabet = "D"
            case 4: monsterIndexAlphabet = "E"
            default: break
            }
        }

        return (monsterNode, monsterIndexAlphabet)
    }
}

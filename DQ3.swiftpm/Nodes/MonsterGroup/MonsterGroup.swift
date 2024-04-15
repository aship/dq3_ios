//
//  MonsterGroup.swift
//  DQ3
//
//  Created by aship on 2021/05/21.
//

import Foundation

class MonsterGroup: NSObject {
    var dqMonsterType: DQMonsterType!
    var monsterNodes: [MonsterNode] = []

    init(dqMonsterType: DQMonsterType) {
        self.dqMonsterType = dqMonsterType
    }

    func apendMonsterNode(monsterNode: MonsterNode) {
        self.monsterNodes.append(monsterNode)
    }

    func getNumberOfMonsterNodes() -> Int {
        return self.monsterNodes.count
    }

    func checkSomeMonstersAlive() -> Bool {
        for monsterNode in self.monsterNodes {
            if 0 < monsterNode.hp {
                return true
            }
        }

        return false
    }
}

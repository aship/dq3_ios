//
//  BattleSceneAsyncBattle.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func asyncBattle(
        characterStatus: CharacterStatus,
        battleActionStruct: BattleActionStruct,
        completion: @escaping () -> Void
    ) {
        print(
            "# asyncBattle \(characterStatus.name) Start \(battleActionStruct.battleActionType.rawValue)"
        )

        self.battleActionStruct = battleActionStruct

        print("isBattleFinished \(isBattleFinished)")

        if self.isBattleFinished {
            completion()

            return
        }

        addMessageWindow(
            battleMessageWindowNode: &self.battleMessageWindowNode,
            scene: self.scene,
            scale: self.scene.scale)

        var text1 = ""
        let name = characterStatus.name
        let battleActionType = battleActionStruct.battleActionType

        if battleActionType == .attack {
            text1 = "\(name)のこうげき!"

            self.battleMessageWindowNode.showMessage(
                string: text1,
                line: 0)

            let monsterGroup = self.battleActionStruct.monsterGroup!
            let isSomeMonstersAlive = monsterGroup.checkSomeMonstersAlive()

            if !isSomeMonstersAlive {
                // すでに他のメンバーによって、グループのモンスター全員
                // 倒されている場合、何もしない
                completion()
            }

            let values = selectMonsterFromGroup()
            let monsterNode = values.0
            let monsterIndexAlphabet = values.1

            let actionWait1sec = SKAction.wait(forDuration: 1)

            let runDamageAction = SKAction.run({
                self.damageAction(monsterNode: monsterNode)

                self.showDamageMessage(
                    monsterNode: monsterNode,
                    monsterIndexAlphabet: monsterIndexAlphabet)
            })

            let runShowDamageMessage = SKAction.run({
                if monsterNode.hp <= 0 {
                    self.scene.run(actionWait1sec)
                    self.defeatMonster(
                        monsterNode: monsterNode,
                        monsterIndexAlphabet: monsterIndexAlphabet)

                    // 全部倒したかチェック
                    let isSomeMonstersAlive = self.checkSomeMonstersAlive()

                    if !isSomeMonstersAlive {
                        // モンスター数が0になったら終わり
                        print("SET isBattleFinished true")
                        self.isBattleFinished = true
                    }
                }
            })

            let runEnd = SKAction.run({
                completion()
            })

            let allActions = SKAction.sequence([
                actionWait1sec,
                runDamageAction,
                actionWait1sec,
                runShowDamageMessage,
                actionWait1sec,
                runEnd,
            ])
            self.scene.run(allActions)
        } else if battleActionType == .defend {
            let actionWait1sec = SKAction.wait(forDuration: 1)

            let runShowMessage = SKAction.run({
                let text = "\(name)はみをまもっている"

                self.battleMessageWindowNode.showMessage(
                    string: text,
                    line: 0)
            })

            let runEnd = SKAction.run({
                completion()
            })

            let allActions = SKAction.sequence([
                actionWait1sec,
                runShowMessage,
                actionWait1sec,
                runEnd,
            ])
            self.scene.run(allActions)
        }
    }
}

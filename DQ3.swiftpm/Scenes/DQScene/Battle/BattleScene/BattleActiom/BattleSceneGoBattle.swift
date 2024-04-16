//
//  BattleSceneGoBattle.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func goBattle() {
        self.battleCommandWindowNode.close()
        self.battleTargetWindowNode.close()

        // この時点で、パーティ、モンスターの誰が行動するか、
        // すばやさの値で確定する必要あり。。。
        // どうしよ。 とりあえず、味方しか行動しないことにしよう。
        // モンスターはあとで実装。。。

        let characterStatuses = DataManager.adventureLog.partyCharacterStatuses

        // どうしよ。行動パターンの配列を用意して
        // 順番に回すか

        // 誰、モンスター？パーティの人？
        // たたかう、みをまもっている
        // どうぐ*を使う、誰に
        // じゅもん＊を、誰に

        // 順番はすばやさで回す

        let dispatchGroup = DispatchGroup()
        // 直列キュー / attibutes指定なし
        let dispatchQueue = DispatchQueue(label: "queue")

        // 5つの非同期処理を実行
        for (index, battleActionStruct) in self.battleActionStructs.enumerated() {
            let dispatchSemaphore = DispatchSemaphore(value: 0)

            dispatchQueue.async(group: dispatchGroup) {
                dispatchGroup.enter()

                let characterStatus = characterStatuses[index]

                self.asyncBattle(
                    characterStatus: characterStatus,
                    battleActionStruct: battleActionStruct,
                    completion: {
                        print(
                            "# asyncBattle \(characterStatus.name) End \(battleActionStruct.battleActionType.rawValue)"
                        )

                        dispatchGroup.leave()
                        dispatchSemaphore.signal()
                    })

                dispatchSemaphore.wait()
            }
        }

        // 全ての非同期処理完了後にメインスレッドで処理
        dispatchGroup.notify(queue: .main) {
            self.battleActionStructs = []

            // モンスターが残っている場合、コマンドに行く
            let isSomeMonstersAlive = self.checkSomeMonstersAlive()

            if isSomeMonstersAlive {
                let partyCharacterStatuses = DataManager.adventureLog.partyCharacterStatuses

                self.switchMessageWindowToCommandWindow(
                    battleMessageWindowNode: self.battleMessageWindowNode,
                    battleCommandWindowNode: &self.battleCommandWindowNode,
                    battleTargetWindowNode: &self.battleTargetWindowNode,
                    partyCharacterStatuses: partyCharacterStatuses,
                    monsterGroups: self.monsterGroups,
                    scene: self.scene,
                    scale: self.scene.scale)
            } else {
                // モンスター数が0になったら終わり
                Task {
                    await self.winMonster()

                }
            }

            print("All Process Done!")
        }
    }
}

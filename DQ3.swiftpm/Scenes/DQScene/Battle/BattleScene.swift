//
//  BattleScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

// print するために : String が必要
enum BattleActionType: String {
    case attack  // たたかう
    case defend  // ぼうぎょ
}

class BattleScene: DQScene {
    var battleMessageWindowNode = BattleMessageWindowNode()
    var battleStatusWindowNode = BattleStatusWindowNode()
    var battleCommandWindowNode = BattleCommandWindowNode(battleScene: nil)
    var battleTargetWindowNode = BattleTargetWindowNode(
        battleScene: nil,
        monsterGroups: [])

    var dqMonsterTypeHash: KeyValuePairs<DQMonsterType, Int> = [:]
    var monsterGroups: [MonsterGroup] = []

    var battleActionStructs: [BattleActionStruct] = []
    var battleActionStruct: BattleActionStruct!

    // 今何人目のコマンドか
    var indexCommand = 0

    // 攻撃シーケンス何番目か
    var indexBattleSequence = 0

    // 敵を全部倒したら終了とする
    var isBattleFinished = false

    func setup() {
        AudioManager.play(dqAudio: .battle)

        self.scene.backgroundColor = .black

        addEnemies()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.addMessageWindow(
                battleMessageWindowNode: &self.battleMessageWindowNode,
                scene: self.scene,
                scale: self.scene.scale)

            self.showInitMessage(
                scene: self.scene,
                scale: self.scene.scale)
        }
    }

    func showInitMessage(
        scene: BaseScene,
        scale: CGFloat
    ) {
        let text1 = "スライムがあらわれた!"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.battleMessageWindowNode.showMessage(
                string: text1,
                line: 0)

            self.addInitialWindows()
        }
    }

    private func addInitialWindows() {
        let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes
        let partyCharacterStatuses = DataManager.adventureLog.partyCharacterStatuses

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.addStatusWindow(
                battleStatusWindowNode: &self.battleStatusWindowNode,
                partyCharacterNodes: partyCharacterNodes,
                scene: self.scene,
                scale: self.scene.scale)

            self.switchMessageWindowToCommandWindow(
                battleMessageWindowNode: self.battleMessageWindowNode,
                battleCommandWindowNode: &self.battleCommandWindowNode,
                battleTargetWindowNode: &self.battleTargetWindowNode,
                partyCharacterStatuses: partyCharacterStatuses,
                monsterGroups: self.monsterGroups,
                scene: self.scene,
                scale: self.scene.scale)
        }
    }
}

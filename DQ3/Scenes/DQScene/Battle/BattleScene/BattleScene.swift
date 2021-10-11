//
//  BattleScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

// print するために : String が必要
enum BattleActionType: String {
    case attack // たたかう
    case defend // ぼうぎょ
}

enum BattleArea: String {
    case aliahan_east
    case aliahan_west
    case leive_west
    case leive_east
}

class BattleScene: DQScene {
    var battleMessageWindowNode = BattleMessageWindowNode(battleScene: nil)
    var battleStatusWindowNode = BattleStatusWindowNode()
    var battleCommandWindowNode = BattleCommandWindowNode(battleScene: nil)
    var battleTargetWindowNode = BattleTargetWindowNode(battleScene: nil,
                                                        monsterGroups: [])
    
    var dqMonsterTypeHash: KeyValuePairs<DQMonsterType, Int> = [:]
    var monsterGroups: [MonsterGroup] = []
    
    var battleActionStructs: [BattleActionStruct] = []
    var battleActionStruct: BattleActionStruct!
    
    // 今何人目のコマンドか
    var indexCommand = 0
    
    // 攻撃シーケンス何番目か
    var indexBattleSequence = 0
    
    // 獲得 exp, ゴールド
    var exp = 0
    var gold = 0
    
    // 敵を全部倒したら終了とする
    var isBattleFinished = false
    
    func setup() {
        AudioManager.play(dqAudio: .battle)
        
        self.scene.backgroundColor = .black
        
        addMonsters()
        
        let actionWait = SKAction.wait(forDuration: 1)
        let actionWait05 = SKAction.wait(forDuration: 0.5)
        
        Task {
            await self.scene.run(actionWait)
            
            self.addMessageWindow(battleMessageWindowNode: &self.battleMessageWindowNode,
                                  scene: self.scene,
                                  scale: self.scene.scale)
            
            let text1 = "スライムがあらわれた!"
            
            await self.scene.run(actionWait05)
            
            await self.battleMessageWindowNode.showMessage(
                string: text1,
                line: 0)
            
            await self.scene.run(actionWait)
            
            self.addInitialWindows()
        }
    }
    
    private func addInitialWindows() {
        let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes
        let partyCharacterStatuses = DataManager.adventureLog.partyCharacterStatuses
        
        self.addStatusWindow(battleStatusWindowNode: &self.battleStatusWindowNode,
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

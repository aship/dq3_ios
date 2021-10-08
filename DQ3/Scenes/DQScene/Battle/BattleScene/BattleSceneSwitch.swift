//
//  BattleSceneSwitch.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func nextBattleOrCommand() {
        self.indexCommand += 1
        
        let partyCharacterCount = DataManager.adventureLog.partyCharacterStatuses.count
        
        if self.indexCommand == partyCharacterCount {
            // バトルに移行
            self.indexCommand = 0
            
            goBattle()
            
            return
        }
        
        let partyCharacterStatuses = DataManager.adventureLog.partyCharacterStatuses
        
        // 次のコマンドに移行
        self.switchCommandWindowToCommandWindow(
            battleCommandWindowNode: &self.battleCommandWindowNode,
            battleTargetWindowNode: &self.battleTargetWindowNode,
            characterStatuses: partyCharacterStatuses,
            monsterGroups: self.monsterGroups,
            index: self.indexCommand,
            scene: self.scene,
            scale: self.scene.scale)
    }
    
    func switchMessageWindowToCommandWindow(battleMessageWindowNode: BattleMessageWindowNode,
                                            battleCommandWindowNode: inout BattleCommandWindowNode,
                                            battleTargetWindowNode: inout BattleTargetWindowNode,
                                            partyCharacterStatuses: [CharacterStatus],
                                            monsterGroups: [MonsterGroup],
                                            scene: BaseScene,
                                            scale: CGFloat) {
        battleMessageWindowNode.close()
        
        self.addCommandWindow(battleCommandWindowNode: &battleCommandWindowNode,
                              characterStatuses: partyCharacterStatuses,
                              index: 0,
                              scene: scene,
                              scale: scale)
        
        self.addTargetWindow(battleTargetWindowNode: &battleTargetWindowNode,
                             monsterGroups: monsterGroups,
                             scene: scene,
                             scale: scale)
    }
    
    private func switchCommandWindowToCommandWindow(battleCommandWindowNode: inout BattleCommandWindowNode,
                                                    battleTargetWindowNode: inout BattleTargetWindowNode,
                                                    characterStatuses: [CharacterStatus],
                                                    monsterGroups: [MonsterGroup],
                                                    index: Int,
                                                    scene: BaseScene,
                                                    scale: CGFloat) {
        battleCommandWindowNode.close()
        battleTargetWindowNode.close()
        
        self.addCommandWindow(battleCommandWindowNode: &battleCommandWindowNode,
                              characterStatuses: characterStatuses,
                              index: index,
                              scene: scene,
                              scale: scale)
        
        self.addTargetWindow(battleTargetWindowNode: &battleTargetWindowNode,
                             monsterGroups: monsterGroups,
                             scene: scene,
                             scale: scale)
    }
}


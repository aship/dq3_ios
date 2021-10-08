//
//  BattleTargetWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/05/19.
//

import SpriteKit

extension BattleTargetWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        var battleActionStruct = BattleActionStruct()
        battleActionStruct.battleActionType = .attack
        battleActionStruct.monsterGroup = self.selectedMonsterGroup
        
        let battleScene = self.battleScene!
        battleScene.battleActionStructs.append(battleActionStruct)
        battleScene.nextBattleOrCommand()
    }
}

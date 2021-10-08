//
//  BattleSpellWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/05/30.
//

import SpriteKit

extension BattleSpellWindowNode {
    func processButtonA() {
        
     //   self.dqSpell
     
        
        var battleActionStruct = BattleActionStruct()
        battleActionStruct.battleActionType = .defend
        
        let battleScene = self.battleScene!
        battleScene.battleActionStructs.append(battleActionStruct)
        
        
        
    }
}

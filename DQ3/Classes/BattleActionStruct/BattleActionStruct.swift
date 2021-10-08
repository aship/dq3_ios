//
//  BattleActionStruct.swift
//  DQ3
//
//  Created by aship on 2021/05/29.
//

import Foundation

struct BattleActionStruct {
    // たたかう、ぼうぎょ、とか
    var battleActionType: BattleActionType!
    
    // 攻撃対象のグループ
    var monsterGroup: MonsterGroup!
    
    var dqSpell: DQSpell!
}

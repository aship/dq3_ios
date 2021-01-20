//
//  Constant.swift
//  TestSwift
//
//  Created by aship on 2020/12/08.
//

import SwiftUI

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let ImagePathHero = "character/vocation/hero"
let ImagePathWarriorFemale = "character/vocation/warrior_female"
let ImagePathPriestFemale = "character/vocation/priest_female"
let ImagePathMageFemale = "character/vocation/mage_female"
let ImagePathLady = "character/npc/lady"

enum BattleStatus {
    case start
    case command
    case combat
    case end
    case moveToField
}

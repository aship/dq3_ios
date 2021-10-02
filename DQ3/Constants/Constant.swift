//
//  Constant.swift
//  TestSwift
//
//  Created by aship on 2020/12/08.
//

import SwiftUI

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

// x: 48, y: 136 は左上(0, 0)基準
let MapMessageWindowChildOfScenePointX = -128 + 48
let MapMessageWindowChildOfScenePointY = 112 - 136

let MapMessageWindowChildOfCommandWindowPointX = 0
let MapMessageWindowChildOfCommandWindowPointY = -128

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

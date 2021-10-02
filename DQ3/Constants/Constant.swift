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

let MapMessageWindowChildOfSpellPointX = -112
let MapMessageWindowChildOfSpellPointY = -128

let MapMessageWindowChildOfZoomPointX = -16
let MapMessageWindowChildOfZoomPointY = -16

enum DQAdventureLogTop {
    case go // ぼうけんをする
    case change_message_speed // ひょうじそくどをかえる
    case create // ぼうけんのしょをつくる
    case copy // ぼうけんのしょをうつす
    case delete // ぼうけんのしょをけす
}

enum DQYesNo {
    case yes
    case no
}

enum DQGender: String {
    case male
    case female
}

enum FieldMoveMode {
    case walk
    case ship
    case ramia
}

enum BattleStatus {
    case start
    case command
    case combat
    case end
    case moveToField
}

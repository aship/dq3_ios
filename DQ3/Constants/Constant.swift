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

// コマンドのあとのメッセージウインドウ位置
let MapMessageWindowChildOfCommandWindowPointX = 0
let MapMessageWindowChildOfCommandWindowPointY = -128

// コマンドのあとのステータスウインドウ位置
let MapStatusWindowChildOfCommandWindowPointX = 0
let MapStatusWindowChildOfCommandWindowPointY = -144

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

// morning から after_nonn が昼扱い
// night から dawn が夜扱い
enum DQTimeZone {
    case morning
    case before_noon
    case noon
    case after_noon
    case night
    case mid_night
    case dawn
}

enum DQYesNo {
    case yes
    case no
}

enum FieldMoveMode {
    case walk
    case ship
    case ramia
}

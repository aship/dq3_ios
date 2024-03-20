//
//  DQSceneType.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

// タイトル、冒険の書選択画面だけ特殊
// それ以外は全て adventure_log_loaded
enum DQMainState: String {
    case title
    case select_adventure_log
    case adventure_log_loaded
}

enum DQSceneType: String {
    case opening
    case aliahan_town
    case aliahan_town_house
}

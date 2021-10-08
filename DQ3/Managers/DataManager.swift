//
//  DataManager.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import Foundation

class DataManager {
    static var dqMainState = debugDqMainState
    
    // 現在読み込んでいる冒険の書
    static var adventureLog = AdventureLog()
    
    // 現在読み込んでいる冒険の書の番号
    // ぼうけんのしょ1 -> 1
    // 0 は読み込んでない状態
    static var adventureLogNumber = 0
    
    // ロード直後 flag
    static var launchAdventureLog = false
    
    static var queueFollowDirections: [Direction] = []
    static var showInsideMap = false
    
    // trainsigionToMap で使う
    static var scene = BaseScene()
    
    // はなす、で使う
    static var aliahanTownScene: AliahanTownScene!
    
    static var shipPositionX = 0
    static var shipPositionY = 0
    static var shipDirection: Direction = .up
    
    private init() {
    }
}

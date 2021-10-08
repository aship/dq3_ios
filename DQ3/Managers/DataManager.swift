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
    
    static var queueFollowDirections: [Direction] = []
    static var showInsideMap = false
    
    // 船/ラーミアの位置
    static var resetShipPosition = true
    static var shipPositionX = 0
    static var shipPositionY = 0
    static var shipDirection: Direction = .up
    
    static var resetRamiaPosition = true
    static var ramiaPositionX = 0
    static var ramiaPositionY = 0
    static var ramiaDirection: Direction = .up
    
    // 冒険の書を再開した場所 or 最後にルーラで到着した場所
    // 船/ラーミアの初期位置リセットのために使う
    static var currentZoomArea: DQZoom = .aliahan
    
    // trainsigionToMap で使う
    static var scene = BaseScene()
    
    // はなす、で使う
    static var aliahanTownScene: AliahanTownScene!
    
    private init() {
    }
}

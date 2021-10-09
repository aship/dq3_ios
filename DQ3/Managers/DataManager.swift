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
    static var adventureLogNumber: Int?
    
    static var queueFollowDirections: [Direction] = []
    static var showInsideMap = false
    
    // 船/ラーミアの位置は冒険の書には保存されない
    // 船/ラーミアの位置がリセットされるのは
    // ルーラ使用時と、冒険の書読み込み時
    // 向きはルーラでもリセットされない
    // 冒険の書読み込み時のデフォルトは上
    static var resetShipPosition = true
    static var shipPositionX = 0
    static var shipPositionY = 0
    static var shipDirection: Direction = .up
    
    static var resetRamiaPosition = true
    static var ramiaPositionX = 0
    static var ramiaPositionY = 0
    static var ramiaDirection: Direction = .up
    
    // 戦闘から戻るときに使う type
    static var dqSceneTypeFromBattle: DQSceneType = .field
    
    // 冒険の書を再開した場所 or 最後にルーラで到着した場所
    // 船/ラーミアの初期位置リセットのために使う
    static var currentZoomArea: DQZoom = .aliahan
    
    // trainsigionToMap で使う
    static var scene = BaseScene()
    
    // はなす、で使う
    static var aliahanTownScene: AliahanTownScene!
    
    private init() {
    }
    
    class func saveAdventureLog() {
        let adventureLog = self.adventureLog
        let number = self.adventureLogNumber!
        
        UserDefaultsUtil.saveAdventureLog(adventureLog: adventureLog,
                                          number: number)
    }
    
    class func loadAdventureLog(number: Int) {
        self.adventureLogNumber = number
        self.adventureLog = UserDefaultsUtil.loadAdventureLog(number: number)!
    }
}

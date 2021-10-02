//
//  DataManager.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import Foundation

class DataManager {
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
    
    // 船の位置は冒険の書には保存されない
    // 船の位置がリセットされるのは
    // ルーラ使用時と、冒険の書読み込み時
    // 向きはルーラでもリセットされない
    // 冒険の書読み込み時のデフォルトは上
    static var resetShipPosition = true
    static var shipPositionX = 0
    static var shipPositionY = 0
    static var shipDirection: Direction = .up
    
    // 冒険の書を再開した場所 or 最後にルーラで到着した場所
    // 船の初期位置リセットのために使う
    static var currentZoomArea: DQZoom = .aliahan
    
    static var scene = BaseScene()
    
    // はなす、で使う
    static var aliahanTownScene: AliahanTownScene!
    
    private init() {
    }
    
    class func saveAdventureLog() {
        let adventureLog = self.adventureLog
        let number = self.adventureLogNumber
        
        UserDefaultsUtil.saveAdventureLog(adventureLog: adventureLog,
                                          number: number)
    }
    
    class func loadAdventureLog(number: Int) {
        self.launchAdventureLog = true
        
        self.adventureLogNumber = number
        self.adventureLog = UserDefaultsUtil.loadAdventureLog(number: number)!
    }
}

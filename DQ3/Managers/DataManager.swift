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

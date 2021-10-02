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
    
    static var queueFollowDirections: [Direction] = []
    static var showInsideMap = false
    
    // はなす、で使う
    static var scene = BaseScene()
    
    private init() {
    }
}

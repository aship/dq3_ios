//
//  DataManager.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import Foundation

class DataManager {
    static var dqStory: DQStory = .opening
    // static var dqStory: DQStory = .mother_waiting
    // static var dqStory: DQStory = .go_adventure
    
    // 現在読み込んでいる冒険の書
    static var adventureLog = AdventureLog()
    
    static var showInsideMap = false
    
    // for adventureLog transition
    static var adventureLogScene = AdventureLogScene()
    
    private init() {
    }
}

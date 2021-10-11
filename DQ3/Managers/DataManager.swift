//
//  DataManager.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import Foundation

class DataManager {
    static var dqMainState = debugDqMainState
    
    static var dqSceneType: DQSceneType = .opening
    // static var dqSceneType: DQSceneType = .aliahan_town_house
    // static var dqSceneType: DQSceneType = .aliahan_town
    // static var dqSceneType: DQSceneType = .field
    
    static var dqStory: DQStory = .opening
    // static var dqStory: DQStory = .mother_waiting
    // static var dqStory: DQStory = .go_adventure
    
    // 現在読み込んでいる冒険の書
    static var adventureLog = AdventureLog()
    
    static var queueFollowDirections: [Direction] = []
    static var showInsideMap = false
    
    // trainsigionToMap で使う
    static var scene = BaseScene()
    
    private init() {
    }
}

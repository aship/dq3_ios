//
//  DataManager.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import Foundation

class DataManager {
    //static var dqSceneType: DQSceneType = .title
    // static var dqSceneType: DQSceneType = .adventure_log
    // static var dqSceneType: DQSceneType = .opening
     static var dqSceneType: DQSceneType = .aliahan_town_house
    // static var dqSceneType: DQSceneType = .aliahan_town
    // static var dqSceneType: DQSceneType = .field
    
    //static var dqStory: DQStory = .opening
    // static var dqStory: DQStory = .mother_waiting
     static var dqStory: DQStory = .go_adventure
    
    // 戦闘から戻るときに使う type
    static var dqSceneTypeFromBattle: DQSceneType = .field
    
    static var characterNodes: [CharacterNode] = [CharacterNode(dqCharacter: .hero)]
    static var queueFollowDirections: [Direction] = []
    static var showInsideMap = false
    static var scene = BaseScene()
    
    private init() {
    }
}

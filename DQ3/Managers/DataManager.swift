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
    
    static var characterNodes: [CharacterNode] = [CharacterNode(dqCharacter: .hero)]
    static var showInsideMap = false
    
    private init() {
    }
}

//
//  AdventureLog.swift
//  DQ3
//
//  Created by aship on 2021/04/11.
//

import SpriteKit

class AdventureLog: NSObject {
    var heroName: String = ""
    var partyCharacterNodes: [CharacterNode] = []

    var dqSceneType: DQSceneType = .opening
    var dqStory: DQStory = .opening
}

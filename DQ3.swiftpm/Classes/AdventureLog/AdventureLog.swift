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
    var partyCharacterStatuses: [CharacterStatus] = []

    var dqSceneType: DQSceneType = .opening
    var dqStory: DQStory = .opening

    // 船/ラーミア所持
    var hasShip = false
    var hasRamia = false
}

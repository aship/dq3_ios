//
//  ContentViewDebug.swift
//  DQ3
//
//  Created by aship on 2021/04/12.
//

import Foundation

// デバッグ用の冒険の書を作成
func setDebugAdventureLog() {
    let adventureLog = AdventureLog()
    
    adventureLog.heroName = "えにくす"
    
    addNode(adventureLog: adventureLog,
            name: "あしへー",
            dqCharacter: .hero,
            dqVocation: .hero)
    
    // adventureLog.dqSceneType = .opening
    // adventureLog.dqSceneType = .aliahan_town_house
    adventureLog.dqSceneType = .aliahan_town
    // adventureLog.dqSceneType = .field
    
    // adventureLog.dqStory = .opening
    // adventureLog.dqStory = .mother_waiting
    adventureLog.dqStory = .go_adventure
    
    addNode(adventureLog: adventureLog,
            name: "あしひー",
            dqCharacter: .warrior_female,
            dqVocation: .warrior)
    
    addNode(adventureLog: adventureLog,
            name: "あしひひ",
            dqCharacter: .priest_female,
            dqVocation: .priest)
    
    //    addNode(adventureLog: adventureLog,
    //            name: "あしひん",
    //            dqCharacter: .mage_female,
    //            dqVocation: .mage)
    
        if adventureLog.dqSceneType == .aliahan_town {
            for node in adventureLog.partyCharacterNodes {
                node.positionX = AliahanTownEntrancePositionX
                node.positionY = AliahanTownEntrancePositionY
            }
        }
    
    DataManager.adventureLog = adventureLog
}

private func addNode(adventureLog: AdventureLog,
                     name: String,
                     dqCharacter: DQCharacter,
                     dqVocation: DQVocation) {
    let node = CharacterNode(dqCharacter: dqCharacter)
    
    adventureLog.partyCharacterNodes.append(node)
}
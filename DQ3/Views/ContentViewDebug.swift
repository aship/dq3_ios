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
            dqVocation: .hero,
            dqGender: .male)
    
    // adventureLog.dqSceneType = .opening
    // adventureLog.dqSceneType = .aliahan_town_house
    // adventureLog.dqSceneType = .aliahan_town
    adventureLog.dqSceneType = .field
    
    // adventureLog.dqStory = .opening
    // adventureLog.dqStory = .mother_waiting
    adventureLog.dqStory = .go_adventure
    
    adventureLog.hasShip = true
    adventureLog.hasRamia = true
    
    addNode(adventureLog: adventureLog,
            name: "あしひー",
            dqCharacter: .warrior_female,
            dqVocation: .warrior,
            dqGender: .female)
    
    addNode(adventureLog: adventureLog,
            name: "あしひひ",
            dqCharacter: .priest_female,
            dqVocation: .priest,
            dqGender: .female)
    
    addNode(adventureLog: adventureLog,
            name: "あしひん",
            dqCharacter: .mage_female,
            dqVocation: .mage,
            dqGender: .female)
    
    if adventureLog.dqSceneType == .field {
        for node in adventureLog.partyCharacterNodes {
            node.positionX = FieldAliahanPositionX
            node.positionY = FieldAliahanPositionY
        }
    }
    else if adventureLog.dqSceneType == .aliahan_town {
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
                     dqVocation: DQVocation,
                     dqGender: DQGender) {
    let node = CharacterNode(dqCharacter: dqCharacter)
    
    adventureLog.partyCharacterNodes.append(node)
    
    let status = CharacterStatus()
    status.name = name
    status.dqGender = dqGender
    status.dqVocation = dqVocation
    status.hp = Int.random(in: 1 ... 999)
    status.hpMax = Int.random(in: 1 ... 999)
    status.mp = Int.random(in: 1 ... 999)
    status.mpMax = Int.random(in: 1 ... 999)
    status.level = Int.random(in: 1 ... 99)
    
    adventureLog.partyCharacterStatuses.append(status)
}

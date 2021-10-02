//
//  ContentViewDebug.swift
//  DQ3
//
//  Created by aship on 2021/04/12.
//

import Foundation

// 起動時のデータを作成
func setDebugCurrentMemory() {
    let adventureLog = AdventureLog()
    
    //adventureLog.dqSceneType = .title
    // adventureLog.dqSceneType = .opening
    // adventureLog.dqSceneType = .aliahan_town_house
    // adventureLog.dqSceneType = .aliahan_town
    adventureLog.dqSceneType = .alltrades_abbey
    // adventureLog.dqSceneType = .field
    // adventureLog.dqSceneType = .alefgard
    
    //adventureLog.dqStory = .opening
    // adventureLog.dqStory = .mother_waiting
    adventureLog.dqStory = .go_adventure
    
    adventureLog.hasShip = true
    adventureLog.hasRamia = true
    
    addNode(adventureLog: adventureLog,
            name: "あしへー",
            dqCharacter: .hero,
            dqVocation: .hero)
    
    addNode(adventureLog: adventureLog,
            name: "あしひー",
            dqCharacter: .warrior_female,
            dqVocation: .warrior_female)
    
    addNode(adventureLog: adventureLog,
            name: "あしひひ",
            dqCharacter: .priest_female,
            dqVocation: .priest_female)
    
    addNode(adventureLog: adventureLog,
            name: "あしひん",
            dqCharacter: .mage_female,
            dqVocation: .mage_female)
    
    if adventureLog.dqSceneType == .field {
        for node in adventureLog.partyCharacterNodes {
            //            node.positionX = FieldAliahanPositionX
            //            node.positionY = FieldAliahanPositionY
            
            node.positionX = ZoomAlltradesAbbeyPositionX
            node.positionY = ZoomAlltradesAbbeyPositionY
        }
        
        // 船/ラーミアの位置決定
        DataManager.currentZoomArea = .alltrades_abbey  // .aliahan
    }
    else if adventureLog.dqSceneType == .alltrades_abbey {
        for (index, node) in adventureLog.partyCharacterNodes.enumerated() {
            node.positionX = AlltradesAbbeyGameStartPositionX
            node.positionY = AlltradesAbbeyGameStartPositionY - index
            node.direction = AlltradesAbbeyGameStartDirection
            
            if 0 < index {
                DataManager.queueFollowDirections.append(AlltradesAbbeyGameStartDirection)
            }
        }
        
        // 船/ラーミアの位置決定
        DataManager.currentZoomArea = .alltrades_abbey
    }
    else if adventureLog.dqSceneType == .aliahan_town {
        for node in adventureLog.partyCharacterNodes {
            node.positionX = AliahanTownEntrancePositionX
            node.positionY = AliahanTownEntrancePositionY
        }
    }
    else if adventureLog.dqSceneType == .alefgard {
        for node in adventureLog.partyCharacterNodes {
            node.positionX = ZoomTantegelPositionX
            node.positionY = ZoomTantegelPositionY
        }
        
        DataManager.currentZoomArea = .tantegel
    }
    
    DataManager.adventureLog = adventureLog
}

private func addNode(adventureLog: AdventureLog,
                     name: String,
                     dqCharacter: DQCharacter,
                     dqVocation: DQVocation) {
    let node = CharacterNode(dqCharacter: dqCharacter)
    
    adventureLog.partyCharacterNodes.append(node)
    
    let status = CharacterStatus()
    status.name = name
    status.dqGender = .male
    status.dqVocation = dqVocation
    status.hp = Int.random(in: 1 ... 999)
    status.hpMax = Int.random(in: 1 ... 999)
    status.mp = Int.random(in: 1 ... 999)
    status.mpMax = Int.random(in: 1 ... 999)
    status.level = Int.random(in: 1 ... 99)
    
    adventureLog.partyCharacterStatuses.append(status)
}

// 冒険の書1を適当なデータで作成
func setDebugAdventureLog() {
    let adventureLog = AdventureLog()
    // adventureLog.dqSceneType = .opening
    // adventureLog.dqSceneType = .aliahan_town_house
    // adventureLog.dqSceneType = .aliahan_town
    adventureLog.dqSceneType = .alltrades_abbey
    // adventureLog.dqSceneType = .field
    // adventureLog.dqSceneType = .alefgard
    
    adventureLog.dqStory = .opening
    // adventureLog.dqStory = .mother_waiting
    // adventureLog.dqStory = .go_adventure
    
    adventureLog.hasShip = true
    adventureLog.hasRamia = true
    
    addNode(adventureLog: adventureLog,
            name: "あしへー",
            dqCharacter: .hero,
            dqVocation: .hero)
    
    if adventureLog.dqSceneType == .alltrades_abbey {
        for (index, node) in adventureLog.partyCharacterNodes.enumerated() {
            node.positionX = AlltradesAbbeyGameStartPositionX
            node.positionY = AlltradesAbbeyGameStartPositionY - index
            node.direction = AlltradesAbbeyGameStartDirection
            
            if 0 < index {
                DataManager.queueFollowDirections.append(AlltradesAbbeyGameStartDirection)
            }
        }
        
        // 船/ラーミアの位置決定
        DataManager.currentZoomArea = .alltrades_abbey
    }
    
    UserDefaultsUtil.saveAdventureLog(adventureLog: adventureLog,
                                      number: 1)
}

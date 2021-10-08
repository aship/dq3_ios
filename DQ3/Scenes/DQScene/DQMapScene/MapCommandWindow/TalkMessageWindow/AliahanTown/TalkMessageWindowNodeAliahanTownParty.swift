//
//  AliahanTownSceneParty.swift
//  DQ3
//
//  Created by aship on 2020/12/28.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func addParties() {
        if DataManager.adventureLog.partyCharacterNodes.count == 4 {
            return
        }
        
        DataManager.adventureLog.partyCharacterNodes.append(CharacterNode(dqCharacter: .warrior_female))
        DataManager.adventureLog.partyCharacterNodes.append(CharacterNode(dqCharacter: .priest_female))
        DataManager.adventureLog.partyCharacterNodes.append(CharacterNode(dqCharacter: .mage_female))
        
        DataManager.queueFollowDirections = [.left, .left, .left]
        
        // パーティメンバー
        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            if index == 0 {
                // Head はスルー
                continue
            }
            
            if index == 1 {
                node.positionX = 3
                node.positionY = 32
            }
            else if index == 2 {
                node.positionX = 4
                node.positionY = 32
            }
            else if index == 3 {
                node.positionX = 5
                node.positionY = 32
            }
            
            let mainTileMapNode = DataManager.aliahanTownScene.mainTileMapNode!
            let scale = DataManager.scene.scale
            
            node.addToMap(tileMapNode: mainTileMapNode,
                          isTown: true)
            
            node.initDirection(direction: .left)
            node.setPosition(tileMapNode: mainTileMapNode,
                             withMoveMap: false,
                             scale: scale)
            
            node.zPosition = ZPositionPartyHead - CGFloat(index)
        }
    }
}

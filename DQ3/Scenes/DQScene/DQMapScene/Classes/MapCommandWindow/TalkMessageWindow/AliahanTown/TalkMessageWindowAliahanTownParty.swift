//
//  AliahanTownSceneParty.swift
//  DQ3
//
//  Created by aship on 2020/12/28.
//

import SpriteKit

extension TalkMessageWindowAliahanTown {
    func addParties() {
        if DataManager.characterNodes.count == 4 {
            return
        }
        
        DataManager.characterNodes.append(CharacterNode(dqCharacter: .warrior_female))
        DataManager.characterNodes.append(CharacterNode(dqCharacter: .priest_female))
        DataManager.characterNodes.append(CharacterNode(dqCharacter: .mage_female))
        
        DataManager.queueFollowDirections = [.left, .left, .left]
        
        // パーティメンバー
        for (index, node) in DataManager.characterNodes.enumerated() {
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
            
//            node.addToMap(tileMapNode: self.mainTileMapNode,
//                          isTown: true)
//            
//            node.initDirection(direction: .left)
//            node.setPosition(tileMapNode: self.mainTileMapNode,
//                             isHead: false,
//                             scale: self.scene.scale)
//            
            node.zPosition = ZPositionPartyHead - CGFloat(index)
        }
    }
}

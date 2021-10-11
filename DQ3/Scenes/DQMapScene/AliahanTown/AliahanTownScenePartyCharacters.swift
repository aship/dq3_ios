//
//  AliahanTownScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            scale: CGFloat) {
        var isHead: Bool!
        
        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            node.addToMap(tileMapNode: tileMapNode,
                          isTown: true)
            
            if index == 0 {
                isHead = true
                
                node.setMovePermitted()
            }
            else {
                isHead = false
            }
            
            node.initDirection(direction: node.direction)
            node.setPosition(tileMapNode: tileMapNode,
                             withMoveMap: isHead,
                             scale: scale)
            
            node.zPosition = CGFloat(4 - index)
        }
    }
}

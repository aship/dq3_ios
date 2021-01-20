//
//  FieldScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension FieldScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            scale: CGFloat) {
        var isHead: Bool!
        
        for (index, node) in DataManager.characterNodes.enumerated() {            
            node.addToMap(tileMapNode: tileMapNode,
                          isTown: false)
            
            if index == 0 {
                isHead = true
                
                node.setMovePermitted()
            }
            else {
                isHead = false
            }
            
            node.initDirection(direction: node.direction)
            node.setPosition(tileMapNode: tileMapNode,
                             isHead: isHead,
                             scale: scale)
            
            node.zPosition = ZPositionPartyHead - CGFloat(index)
        }
    }
}

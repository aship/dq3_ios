//
//  DQMapSceneNpc.swift
//  DQ3
//
//  Created by aship on 2021/01/13.
//

import SpriteKit

extension DQMapScene {
    func addNpcToMap(name: String,
                     dqCharacter: DQCharacter,
                     positionX: Int,
                     positionY: Int,
                     direction: Direction,
                     tileMapNode: SKTileMapNode,
                     characterNpcNodes: inout [CharacterNode],
                     scale: CGFloat) {
        let node = CharacterNode(dqCharacter: dqCharacter)
        
        node.addToMap(tileMapNode: tileMapNode,
                      isTown: true)
        
        node.positionX = positionX
        node.positionY = positionY
        node.initDirection(direction: direction)
        
        node.name = name
        node.zPosition = ZPositionMainNpc
        node.setPosition(tileMapNode: tileMapNode,
                         withMoveMap: false,
                         scale: scale)
        
        characterNpcNodes.append(node)
    }
    
    func addNpcTalkToMap(name: String,
                         positionX: Int,
                         positionY: Int,
                         tileMapNode: SKTileMapNode,
                         characterNpcNodes: inout [CharacterNode],
                         scale: CGFloat) {
        let node = CharacterNode(dqCharacter: .none)
        node.addToMap(tileMapNode: tileMapNode,
                      isTown: true)
        node.positionX = positionX
        node.positionY = positionY
        node.name = name
        node.setPosition(tileMapNode: tileMapNode,
                         withMoveMap: false,
                         scale: scale)
        
        characterNpcNodes.append(node)
    }
}

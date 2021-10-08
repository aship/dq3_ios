//
//  DQMapSceneVehicle.swift
//  DQ3
//
//  Created by aship on 2021/03/31.
//

import SpriteKit

extension DQMapScene {
    func addVehicleToMap(name: String,
                         dqCharacter: DQCharacter,
                         positionX: Int,
                         positionY: Int,
                         direction: Direction,
                         tileMapNode: SKTileMapNode,
                         characterNode: inout CharacterNode?,
                         scale: CGFloat) {
        characterNode = CharacterNode(dqCharacter: dqCharacter)
        
        characterNode?.addToMap(tileMapNode: tileMapNode,
                                isTown: false)
        
        characterNode?.positionX = positionX
        characterNode?.positionY = positionY
        characterNode?.initDirection(direction: direction)
        
        characterNode?.name = name
        characterNode?.zPosition = ZPositionMainNpc
        characterNode?.setPosition(tileMapNode: tileMapNode,
                                   withMoveMap: false,
                                   scale: scale)
    }
}

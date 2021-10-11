//
//  BaseMapSceneCharacterNpc.swift
//  DQ3
//
//  Created by aship on 2020/12/23.
//

import SpriteKit

extension BaseMapScene {
    func setCharacterNpcPosition(positionX: Int,
                                 positionY: Int,
                                 node: SKSpriteNode,
                                 tileMapNode: SKTileMapNode,
                                 scale: CGFloat) {
        let mapSize = tileMapNode.mapSize
        
        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)
        
        let values = getMoveToOrigin(mapWidth: mapWidth,
                                     mapHeight: mapHeight)
        
        let characterMoveX: CGFloat = values.0
        let characterMoveY: CGFloat = values.1
        
        // 一旦、(0, 0)に移動
        let actionCharacter = SKAction.moveBy(x: characterMoveX,
                                              y: characterMoveY,
                                              duration: 0)
        node.run(actionCharacter)
        
        // 任意の場所に移動
        let characterMoveX2 = CGFloat(positionX * 16)
        let characterMoveY2 = CGFloat(positionY * 16)
        
        let actionCharacter2 = SKAction.moveBy(x: characterMoveX2,
                                               y: characterMoveY2,
                                               duration: 0)
        node.run(actionCharacter2)
    }
}

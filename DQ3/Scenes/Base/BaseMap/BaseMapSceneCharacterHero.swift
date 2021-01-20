//
//  BaseMapSceneCharacterHero.swift
//  DQ3
//
//  Created by aship on 2020/12/23.
//

import SpriteKit

extension BaseMapScene {
    func setCharacterHeroPosition(positionX: Int,
                                  positionY: Int,
                                  node: SKSpriteNode,
                                  tileMapNode: SKTileMapNode,
                                  scale: CGFloat) {
        let mapSize = tileMapNode.mapSize
        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)
        
        let isNumberOfColumnsEven = tileMapNode.numberOfColumns.isMultiple(of: 2)
        
        // 0, 0 に移動
        let values = getMoveToOrigin(mapWidth: mapWidth,
                                     mapHeight: mapHeight,
                                     isNumberOfColumnsEven: isNumberOfColumnsEven)
        
        let characterMoveX: CGFloat = values.0
        let characterMoveY: CGFloat = values.1
        
        // 一旦、(0, 0)に移動
        let actionCharacter = SKAction.moveBy(x: characterMoveX,
                                              y: characterMoveY,
                                              duration: 0)
        node.run(actionCharacter)
        
        let mapMoveX = -characterMoveX * scale
        let mapMoveY = -characterMoveY * scale
        
        // heroの場合 map も逆方向に移動
        let actionMap = SKAction.moveBy(x: mapMoveX,
                                        y: mapMoveY,
                                        duration: 0)
        tileMapNode.run(actionMap)
        
        // 任意の場所に移動
        let characterMoveX2 = CGFloat(positionX * 16)
        let characterMoveY2 = CGFloat(positionY * 16)
        
        let actionCharacter2 = SKAction.moveBy(x: characterMoveX2,
                                               y: characterMoveY2,
                                               duration: 0)
        node.run(actionCharacter2)
        
        let mapMoveX2 = -characterMoveX2 * scale
        let mapMoveY2 = -characterMoveY2 * scale
        
        // heroの場合 map も逆方向に移動
        let actionMap2 = SKAction.moveBy(x: mapMoveX2,
                                         y: mapMoveY2,
                                         duration: 0)
        tileMapNode.run(actionMap2)
    }
}

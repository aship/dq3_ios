//
//  CharacterNodePosition.swift
//  DQ3
//
//  Created by aship on 2020/12/27.
//

import SpriteKit

extension CharacterNode {
    func setPosition(tileMapNode: SKTileMapNode,
                     isHead: Bool,
                     scale: CGFloat) {
        setCharacterPosition(tileMapNode: tileMapNode,
                             scale: scale)
        if !isHead {
            return
        }
        
        // Head の場合のみ Map の逆移動が必要
        setMapPosition(tileMapNode: tileMapNode,
                       scale: scale)
    }
    
    private func setCharacterPosition(tileMapNode: SKTileMapNode,
                                      scale: CGFloat) {
        let mapSize = tileMapNode.mapSize
        
        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)
        
        let isNumberOfColumnsEven = tileMapNode.numberOfColumns.isMultiple(of: 2)
        
        // (0, 0) に移動
        let moves = getMoveToOrigin(mapWidth: mapWidth,
                                    mapHeight: mapHeight,
                                    isNumberOfColumnsEven: isNumberOfColumnsEven)
        
        let moveToOriginX: CGFloat = moves.0
        let moveToOriginY: CGFloat = moves.1
        
        let actionToOrigin = SKAction.moveBy(x: moveToOriginX,
                                             y: moveToOriginY,
                                             duration: 0)
        self.run(actionToOrigin)
        
        // 目的の場所に移動
        let moveToTargetX = CGFloat(self.positionX * 16)
        let moveToTargetY = CGFloat(self.positionY * 16)
        
        let actionToTarget = SKAction.moveBy(x: moveToTargetX,
                                             y: moveToTargetY,
                                             duration: 0)
        self.run(actionToTarget)
    }
    
    private func setMapPosition(tileMapNode: SKTileMapNode,
                                scale: CGFloat) {
        let mapSize = tileMapNode.mapSize
        
        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)
        
        let isNumberOfColumnsEven = tileMapNode.numberOfColumns.isMultiple(of: 2)
        
        // (0, 0) に移動
        let moves = getMoveToOrigin(mapWidth: mapWidth,
                                    mapHeight: mapHeight,
                                    isNumberOfColumnsEven: isNumberOfColumnsEven)
        
        let moveToOriginX: CGFloat = moves.0 * scale
        let moveToOriginY: CGFloat = moves.1 * scale
        
        // 地図は逆方向に動かす
        let actionToOrigin = SKAction.moveBy(x: -moveToOriginX,
                                             y: -moveToOriginY,
                                             duration: 0)
        tileMapNode.run(actionToOrigin)
        
        // 目的の場所に移動
        let moveToTargetX = CGFloat(self.positionX * 16) * scale
        let moveToTargetY = CGFloat(self.positionY * 16) * scale
        
        // 地図は逆方向に動かす
        let actionToTarget = SKAction.moveBy(x: -moveToTargetX,
                                             y: -moveToTargetY,
                                             duration: 0)
        tileMapNode.run(actionToTarget)
    }
    
    // キャラをタイルマップの右下(0, 0)に移動するための微調整
    // タイルマップの横のキャラ数が偶数、奇数かによって変わる
    // 図がないと説明しずらい
    private func getMoveToOrigin(mapWidth: Int,
                                 mapHeight: Int,
                                 isNumberOfColumnsEven: Bool) -> (CGFloat, CGFloat) {
        let moveX: CGFloat!
        let moveY: CGFloat!
        
        if isNumberOfColumnsEven {
            moveX = CGFloat(-mapWidth / 2)
        }
        else {
            moveX = CGFloat(-mapWidth / 2) - 8
        }
        
        moveY = CGFloat(-mapHeight / 2 + 8)
        
        return (moveX, moveY)
    }
}

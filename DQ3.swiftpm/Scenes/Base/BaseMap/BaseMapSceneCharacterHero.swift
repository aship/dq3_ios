//
//  BaseMapSceneCharacterHero.swift
//  DQ3
//
//  Created by aship on 2020/12/23.
//

import SpriteKit

extension BaseMapScene {
    internal func setCharacterHeroPosition(
        positionX: Int,
        positionY: Int,
        node: SKSpriteNode,
        tileMapNode: SKTileMapNode,
        scale: CGFloat
    ) {
        let mapSize = tileMapNode.mapSize
        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)

        // 一旦キャラを position(0, 0) の位置に持っていってから
        // 希望の position に移動する

        // position (0, 0) に移動するための移動量を計算
        let values = getMoveToOrigin(
            mapWidth: mapWidth,
            mapHeight: mapHeight)

        let characterMoveX: CGFloat = values.0
        let characterMoveY: CGFloat = values.1

        let actionCharacter = SKAction.moveBy(
            x: characterMoveX,
            y: characterMoveY,
            duration: 0)
        // position (0, 0) に移動
        node.run(actionCharacter)

        // 目的の position に移動するための移動量を計算
        let characterMoveX2 = CGFloat(positionX * 16)
        let characterMoveY2 = CGFloat(positionY * 16)

        let actionCharacter2 = SKAction.moveBy(
            x: characterMoveX2,
            y: characterMoveY2,
            duration: 0)
        // 目的の position に移動
        node.run(actionCharacter2)
    }

    internal func setMapPosition(
        positionX: Int,
        positionY: Int,
        tileMapNode: SKTileMapNode,
        scale: CGFloat
    ) {
        let mapSize = tileMapNode.mapSize
        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)

        // 一旦マップの position(0, 0) がキャラの標準位置になるように持っていってから
        // キャラの位置がキャラの標準位置になるようにの希望の position 分、マップを逆方向に移動する

        // マップの position (0, 0) がキャラの標準位置に移動するための移動量を計算
        let values = getMoveToOrigin(
            mapWidth: mapWidth,
            mapHeight: mapHeight)

        let characterMoveX: CGFloat = values.0
        let characterMoveY: CGFloat = values.1

        let mapMoveX = -characterMoveX * scale
        let mapMoveY = -characterMoveY * scale

        let actionMap = SKAction.moveBy(
            x: mapMoveX,
            y: mapMoveY,
            duration: 0)

        // マップの position (0, 0) がキャラの標準位置に移動
        // (キャラの動きとは逆方向)
        tileMapNode.run(actionMap)

        // 今度はキャラが、キャラの標準位置に移動するためのマップの移動量を計算
        let characterMoveX2 = CGFloat(positionX * 16)
        let characterMoveY2 = CGFloat(positionY * 16)

        let mapMoveX2 = -characterMoveX2 * scale
        let mapMoveY2 = -characterMoveY2 * scale

        let actionMap2 = SKAction.moveBy(
            x: mapMoveX2,
            y: mapMoveY2,
            duration: 0)
        // キャラをキャラの標準位置に移動するために、マップを逆方向に動かす
        tileMapNode.run(actionMap2)
    }
}

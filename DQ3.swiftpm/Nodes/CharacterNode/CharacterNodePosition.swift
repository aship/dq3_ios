//
//  CharacterNodePosition.swift
//  DQ3
//
//  Created by aship on 2020/12/27.
//

import SpriteKit

extension CharacterNode {
    func setPosition(
        tileMapNode: SKTileMapNode,
        withMoveMap: Bool,
        scale: CGFloat
    ) {
        initPosition()
        setCharacterPosition(
            tileMapNode: tileMapNode,
            scale: scale)
        if !withMoveMap {
            return
        }

        // Head の場合のみ Map の逆移動が必要
        setMapPosition(
            tileMapNode: tileMapNode,
            scale: scale)
    }

    private func initPosition() {
        // 横256ドット x 縦240 ドットのうち
        // キャラの中心点は、
        // キャラの左端が左から128ドットの位置にある必要がありこれは満たす
        // キャラの上下は 112ドットの空いている必要がある(つまり縦方向にはど真ん中)
        // これを補正するために 8 ドッド下にずらす
        let pointX: CGFloat = 0
        var pointY: CGFloat = -8

        // 街とか城でははキャラは 4ドット 上に浮いてる
        if self.isTown {
            pointY += 4
        }

        self.position = CGPoint(
            x: pointX,
            y: pointY)
    }

    private func setCharacterPosition(
        tileMapNode: SKTileMapNode,
        scale: CGFloat
    ) {
        let mapSize = tileMapNode.mapSize

        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)

        // 一旦キャラを position(0, 0) の位置に持っていってから
        // 希望の position に移動する

        // position (0, 0) に移動するための移動量を計算
        let moves = getMoveToOrigin(
            mapWidth: mapWidth,
            mapHeight: mapHeight)

        let moveToOriginX: CGFloat = moves.0
        let moveToOriginY: CGFloat = moves.1

        let actionToOrigin = SKAction.moveBy(
            x: moveToOriginX,
            y: moveToOriginY,
            duration: 0)
        // position (0, 0) に移動
        self.run(actionToOrigin)

        // 目的の position に移動するための移動量を計算
        let moveToTargetX = CGFloat(self.positionX * 16)
        let moveToTargetY = CGFloat(self.positionY * 16)

        let actionToTarget = SKAction.moveBy(
            x: moveToTargetX,
            y: moveToTargetY,
            duration: 0)
        // 目的の position に移動
        self.run(actionToTarget)
    }

    private func setMapPosition(
        tileMapNode: SKTileMapNode,
        scale: CGFloat
    ) {
        let mapSize = tileMapNode.mapSize

        let mapWidth = Int(mapSize.width)
        let mapHeight = Int(mapSize.height)

        // 一旦マップの position(0, 0) がキャラの標準位置になるように持っていってから
        // キャラの位置がキャラの標準位置になるようにの希望の position 分、マップを逆方向に移動する

        // マップの position (0, 0) がキャラの標準位置に移動するための移動量を計算
        let moves = getMoveToOrigin(
            mapWidth: mapWidth,
            mapHeight: mapHeight)

        let moveToOriginX: CGFloat = moves.0 * scale
        let moveToOriginY: CGFloat = moves.1 * scale

        // マップの position (0, 0) がキャラの標準位置に移動
        // (キャラの動きとは逆方向)
        let actionToOrigin = SKAction.moveBy(
            x: -moveToOriginX,
            y: -moveToOriginY,
            duration: 0)
        tileMapNode.run(actionToOrigin)

        // 今度はキャラが、キャラの標準位置に移動するためのマップの移動量を計算
        let moveToTargetX = CGFloat(self.positionX * 16) * scale
        let moveToTargetY = CGFloat(self.positionY * 16) * scale

        let actionToTarget = SKAction.moveBy(
            x: -moveToTargetX,
            y: -moveToTargetY,
            duration: 0)
        // キャラをキャラの標準位置に移動するために、マップを逆方向に動かす
        tileMapNode.run(actionToTarget)
    }

    private func getMoveToOrigin(
        mapWidth: Int,
        mapHeight: Int
    ) -> (CGFloat, CGFloat) {
        let moveX = CGFloat(-mapWidth / 2)
        let moveY = CGFloat(-mapHeight / 2 + 8)

        return (moveX, moveY)
    }
}

//
//  DQMapScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension DQMapScene {
    func addPartyCharacters(
        tileMapNode: SKTileMapNode,
        isTown: Bool,
        scale: CGFloat
    ) {
        var withMoveMap: Bool!

        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            node.addToMap(
                tileMapNode: tileMapNode,
                isTown: isTown)

            if index == 0 {
                withMoveMap = true

                node.setMovePermitted()
            } else {
                withMoveMap = false
            }

            node.initDirection(direction: node.direction)
            node.setPosition(
                tileMapNode: tileMapNode,
                withMoveMap: withMoveMap,
                scale: scale)

            node.zPosition = ZPositionPartyHead - CGFloat(index)
        }
    }
}

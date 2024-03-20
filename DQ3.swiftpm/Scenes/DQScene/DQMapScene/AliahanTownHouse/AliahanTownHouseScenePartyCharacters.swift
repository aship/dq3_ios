//
//  AliahanTownHouseScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addPartyCharacters(
        tileMapNode: SKTileMapNode,
        dqStory: DQStory,
        scale: CGFloat
    ) {
        var isHead: Bool!

        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            node.addToMap(
                tileMapNode: tileMapNode,
                isTown: true)

            if index == 0 {
                isHead = true

                if dqStory == .opening {
                    node.setMoveProhibited()
                } else {
                    node.setMovePermitted()
                }
            } else {
                isHead = false
            }

            if dqStory == .opening {
                node.positionX = AliahanTownHouseMotherPositionX
                node.positionY = AliahanTownHouseMotherPositionY - 1

                node.texture = SKTexture(imageNamed: "character/vocation/hero/sleep")
            } else {
                node.positionX = AliahanTownHouseStairsPositionX
                node.positionY = AliahanTownHouseStairsPositionY

                node.initDirection(direction: .right)
            }

            node.setPosition(
                tileMapNode: tileMapNode,
                withMoveMap: isHead,
                scale: scale)

            node.zPosition = ZPositionPartyHead - CGFloat(index)
        }
    }
}

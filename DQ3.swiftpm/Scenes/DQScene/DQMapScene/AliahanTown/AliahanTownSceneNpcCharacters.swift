//
//  AliahanTownSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownScene {
    func addNpcCharacters(
        mainTileMapNode: SKTileMapNode,
        insideTileMapNode: SKTileMapNode,
        characterNpcNodes: inout [CharacterNode],
        scale: CGFloat,
        dqStory: DQStory
    ) {
        if dqStory == .opening {
            addNpcToMap(
                name: "mother",
                dqCharacter: .lady,
                positionX: AliahanTownMotherStartPositionX,
                positionY: AliahanTownMotherStartPositionY,
                direction: AliahanTownMotherStartDirection,
                tileMapNode: mainTileMapNode,
                characterNpcNodes: &characterNpcNodes,
                scale: scale)

            for node in characterNpcNodes {
                if node.name == "mother" {
                    // 母が消えてしまうのでオープニングだけ特殊処理
                    node.zPosition = ZPositionPartyHead
                }
            }
        } else if dqStory == .mother_waiting {
            addNpcToMap(
                name: "mother",
                dqCharacter: .lady,
                positionX: AliahanTownMotherWaitingPositionX,
                positionY: AliahanTownMotherWaitingPositionY,
                direction: AliahanTownMotherWaitingDirection,
                tileMapNode: mainTileMapNode,
                characterNpcNodes: &characterNpcNodes,
                scale: scale)
        }
    }
}

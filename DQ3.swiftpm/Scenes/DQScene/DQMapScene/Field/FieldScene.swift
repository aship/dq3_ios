//
//  FieldScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class FieldScene: DQMapScene {
    func setup() {
        DataManager.adventureLog.dqSceneType = .field

        AudioManager.play(dqAudio: .field)

        self.scene.backgroundColor = .black

        let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes

        if partyCharacterNodes.count == 1 {
            DataManager.adventureLog.partyCharacterNodes.append(
                CharacterNode(dqCharacter: .warrior_female))
            DataManager.adventureLog.partyCharacterNodes.append(
                CharacterNode(dqCharacter: .priest_female))
            DataManager.adventureLog.partyCharacterNodes.append(
                CharacterNode(dqCharacter: .mage_female))
        }

        for node in DataManager.adventureLog.partyCharacterNodes {
            node.positionX = FieldAliahanPositionX
            node.positionY = FieldAliahanPositionY
        }

        self.addMainTileMap(
            name: "field",
            tileMapNode: &self.mainTileMapNode,
            numberOfImages: 45,
            scale: self.scene.scale)

        addPartyCharacters(
            tileMapNode: self.mainTileMapNode,
            isTown: false,
            scale: self.scene.scale)
    }
}

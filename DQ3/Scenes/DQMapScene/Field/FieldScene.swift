//
//  FieldScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class FieldScene: DQMapScene {
    func setup() {
        DataManager.dqSceneType = .field
        AudioManager.play(dqAudio: .field)
        
        if DataManager.characterNodes.count == 1 {
            DataManager.characterNodes.append(CharacterNode(dqCharacter: .warrior_female))
            DataManager.characterNodes.append(CharacterNode(dqCharacter: .priest_female))
            DataManager.characterNodes.append(CharacterNode(dqCharacter: .mage_female))
            
            for node in DataManager.characterNodes {
                node.positionX = FieldAliahanPositionX
                node.positionY = FieldAliahanPositionY
                node.direction = .down
            }
        }
        
        self.scene.backgroundColor = .black
        
        self.scene.addMainTileMap(name: "field",
                                  tileMapNode: &self.mainTileMapNode,
                                  numberOfImages: 45,
                                  scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           scale: self.scene.scale)
    }
}

//
//  FieldScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class FieldScene: DQMapShipScene {
    var ramiaNode: CharacterNode?
    
    func setup(dqAudio: DQAudio) {
        AudioManager.play(dqAudio: dqAudio)
        
        self.scene.backgroundColor = .black
        self.addMainTileMap(name: "field",
                            tileMapNode: &self.mainTileMapNode,
                            numberOfImages: 45,
                            scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           isTown: false,
                           scale: self.scene.scale)
        
        if DataManager.adventureLog.hasShip {
            addShip(tileMapNode: self.mainTileMapNode,
                    characterNode: &self.shipNode,
                    scale: self.scene.scale)
        }
        
        if DataManager.adventureLog.hasRamia {
            addRamia(tileMapNode: self.mainTileMapNode,
                     characterNode: &self.ramiaNode,
                     scale: self.scene.scale)
        }
    }
}

//
//  FieldScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class FieldScene: DQMapScene {
    func setup() {
        AudioManager.play(dqAudio: .field)
        
        self.scene.backgroundColor = .black
        
        self.addMainTileMap(name: "field",
                            tileMapNode: &self.mainTileMapNode,
                            numberOfImages: 45,
                            scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           scale: self.scene.scale)
    }
}

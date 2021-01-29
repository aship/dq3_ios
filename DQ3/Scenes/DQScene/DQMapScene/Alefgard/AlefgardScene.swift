//
//  AlefgardScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class AlefgardScene: DQMapScene {
    func setup() {
        AudioManager.play(dqAudio: .alefgard)
        
        self.scene.backgroundColor = .black
        
        self.addMainTileMap(name: "alefgard",
                            tileMapNode: &self.mainTileMapNode,
                            numberOfImages: 47,
                            scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           scale: self.scene.scale)
    }
}

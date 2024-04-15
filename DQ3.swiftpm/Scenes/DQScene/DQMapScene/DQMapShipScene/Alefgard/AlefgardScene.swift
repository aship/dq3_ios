//
//  AlefgardScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class AlefgardScene: DQMapShipScene {
    func setup(dqAudio: DQAudio) {
        AudioManager.play(dqAudio: dqAudio)

        self.scene.backgroundColor = .black

        addMainTileMap(
            name: "alefgard",
            tileMapNode: &self.mainTileMapNode,
            numberOfImages: 47,
            scale: self.scene.scale)

        addPartyCharacters(
            tileMapNode: self.mainTileMapNode,
            isTown: false,
            scale: self.scene.scale)

        addShip(
            tileMapNode: self.mainTileMapNode,
            characterNode: &self.shipNode,
            scale: self.scene.scale)
    }
}

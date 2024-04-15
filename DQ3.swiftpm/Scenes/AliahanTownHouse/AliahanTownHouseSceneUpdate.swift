//
//  AliahanTownHouseSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import SpriteKit

extension AliahanTownHouseScene {
    override func update(_ currentTime: TimeInterval) {
        processUpdate(
            padDirection: self.padDirection,
            tileMapNode: self.mainTileMapNode,
            characterNodes: DataManager.adventureLog.partyCharacterNodes,
            queueFollowDirections: &self.queueFollowDirections,
            scale: self.scale)
    }
}

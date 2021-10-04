//
//  AliahanTownSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension AliahanTownScene {
    override func update(_ currentTime: TimeInterval) {
        processUpdate(padDirection: self.padDirection,
                      tileMapNode: self.mainTileMapNode,
                      characterNodes: DataManager.adventureLog.partyCharacterNodes,
                      queueFollowDirections: &self.queueFollowDirections,
                      scale: self.scale)
    }
}

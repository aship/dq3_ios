//
//  AlefgardSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/29.
//

import SpriteKit

extension AlefgardScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode,
                           adventureLog: DataManager.adventureLog,
                           characterNpcNodes: self.characterNpcNodes,
                           queueFollowDirections: &DataManager.queueFollowDirections,
                           tileMapNode: self.mainTileMapNode,
                           scene: self.scene)
        }
        else if button == self.scene.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

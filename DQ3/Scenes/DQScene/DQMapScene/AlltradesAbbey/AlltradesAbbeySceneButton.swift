//
//  AlltradesAbbeySceneButton.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

extension AlltradesAbbeyScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                           mapStatusWindowNode: &self.mapStatusWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode,
                           adventureLog: DataManager.adventureLog,
                           characterNpcNodes: self.characterNpcNodes,
                           queueFollowDirections: &DataManager.queueFollowDirections,
                           tileMapNode: self.mainTileMapNode,
                           scene: self.scene)
        }
        else if button == self.scene.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapStatusWindowNode: self.mapStatusWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

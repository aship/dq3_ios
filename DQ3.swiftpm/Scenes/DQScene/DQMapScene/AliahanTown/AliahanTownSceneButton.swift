//
//  AliahanTownSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/09.
//

import SpriteKit

extension AliahanTownScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            let dqStory = DataManager.adventureLog.dqStory

            if dqStory == .opening {
                processButtonAOpening(
                    mapMessageWindowNode: self.mapMessageWindowNode,
                    openingStateFlag: &self.openingStateFlag)
            } else {
                processButtonA(
                    mapCommandWindowNode: &mapCommandWindowNode,
                    mapMessageWindowNode: mapMessageWindowNode,
                    scale: self.scene.scale)
            }
        }

        if button == self.scene.buttonB {
            processButtonB(mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

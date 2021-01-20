//
//  AliahanTownHouseSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/29.
//

import SpriteKit

extension AliahanTownHouseScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            if DataManager.dqStory == .opening {
                processButtonAOpening(commandWindowNode: self.commandWindowNode,
                                      messageWindowNode: self.messageWindowNode,
                                      openingStateFlag: &self.openingStateFlag)
            }
            else {
                processButtonA(processTalk: processTalk,
                               commandWindowNode: &self.commandWindowNode,
                               messageWindowNode: &self.messageWindowNode,
                               triangleNode: self.scene.triangleNode,
                               isCommandWindowOpen: &self.isCommandWindowOpen,
                               isMessageWindowOpen: &self.isMessageWindowOpen,
                               scale: self.scene.scale)
            }
        }
        else if button == self.scene.buttonB {
            processButtonB(commandWindowNode: self.commandWindowNode,
                           messageWindowNode: self.messageWindowNode,
                           isCommandWindowOpen: &self.isCommandWindowOpen,
                           isMessageWindowOpen: &self.isMessageWindowOpen)
        }
    }
}

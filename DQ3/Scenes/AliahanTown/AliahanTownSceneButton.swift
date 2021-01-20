//
//  AliahanTownSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/09.
//

import SpriteKit

extension AliahanTownScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.buttonA {
            if DataManager.dqStory == .opening {
                processButtonAOpening(commandWindowNode: self.commandWindowNode,
                                      messageWindowNode: self.messageWindowNode,
                                      openingStateFlag: &self.openingStateFlag)
            }
            else {
                processButtonA(commandWindowNode: &self.commandWindowNode,
                               messageWindowNode: &self.messageWindowNode,
                               triangleNode: self.triangleNode,
                               isCommandWindowOpen: &self.isCommandWindowOpen,
                               isMessageWindowOpen: &self.isMessageWindowOpen,
                               scale: self.scale)
            }
        }
        
        if button == self.buttonB {
            processButtonB(commandWindowNode: self.commandWindowNode,
                           messageWindowNode: self.messageWindowNode,
                           isCommandWindowOpen: &self.isCommandWindowOpen,
                           isMessageWindowOpen: &self.isMessageWindowOpen)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}

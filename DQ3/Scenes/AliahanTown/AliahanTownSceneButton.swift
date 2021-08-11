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
                    processButtonAOpening(mapCommandWindowNode: self.mapCommandWindowNode,
                                          mapMessageWindowNode: self.mapMessageWindowNode,
                                      openingStateFlag: &self.openingStateFlag)
            }
            else {
                processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                               mapMessageWindowNode: &self.mapMessageWindowNode,
                               scale: self.scale)
            }
        }
        
        if button == self.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}

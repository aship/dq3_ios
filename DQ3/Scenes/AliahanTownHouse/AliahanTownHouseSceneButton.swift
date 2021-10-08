//
//  AliahanTownHouseSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/29.
//

import SpriteKit

extension AliahanTownHouseScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.buttonA {
            if DataManager.dqStory == .opening {
                processButtonAOpening(mapMessageWindowNode: self.mapMessageWindowNode,
                                      openingStateFlag: &self.openingStateFlag)
            }
        }
        
        if button == self.buttonB {
            processButtonB(mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}
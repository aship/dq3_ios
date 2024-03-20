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
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/AliahanTownHouse/AliahanTownHouseSceneButton.swift
            if DataManager.dqStory == .opening {
                processButtonAOpening(
                    mapMessageWindowNode: self.mapMessageWindowNode,
                    openingStateFlag: &self.openingStateFlag)
            } else {
========
            let dqStory = DataManager.adventureLog.dqStory
            
            if dqStory == .opening {
                processButtonAOpening(mapMessageWindowNode: self.mapMessageWindowNode,
                                      openingStateFlag: &self.openingStateFlag)
            }
            else {
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/AliahanTownHouse/AliahanTownHouseSceneButton.swift
                processButtonA()
            }
        }

        if button == self.scene.buttonB {
            processButtonB(mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

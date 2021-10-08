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
            let dqStory = DataManager.adventureLog.dqStory
            
            if dqStory == .opening {
                processButtonAOpening(mapMessageWindowNode: self.mapMessageWindowNode,
                                      openingStateFlag: &self.openingStateFlag)
            }
            else {
                processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                               mapMessageWindowNode: self.mapMessageWindowNode,
                               adventureLog: DataManager.adventureLog,
                               characterNpcNodes: self.characterNpcNodes,
                               queueFollowDirections: &DataManager.queueFollowDirections,
                               tileMapNode: self.mainTileMapNode,
                               scene: self.scene)
            }
        }
        
        if button == self.scene.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
}

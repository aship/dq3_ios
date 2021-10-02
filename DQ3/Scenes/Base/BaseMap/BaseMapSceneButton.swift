//
//  BaseMapSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseMapScene {
    func willPress(_ button: ButtonOverlay) {
        let willPress = getWillPress(dqSceneType: DataManager.dqSceneType)
        
        willPress(button)
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
    
    func getWillPress(dqSceneType: DQSceneType) -> WillPress {
        var willPress: WillPress!
        
        switch dqSceneType {
        case .battle: willPress = nil //self.battleScene.willPress
        case .opening: willPress = self.openingScene.willPress
        case .field: willPress = self.fieldScene.willPress
        case .aliahan_town: willPress = self.aliahanTownScene.willPress
        case .aliahan_town_house: willPress = self.aliahanTownHouseScene.willPress
        }
        
        return willPress
    }
}

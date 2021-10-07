//
//  BaseSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseScene {
    @objc func willPress(_ button: ButtonOverlay) {
        let dqMainState = DataManager.dqMainState
        let dqSceneType = DataManager.adventureLog.dqSceneType
        
        if let willPress = getWillPress(dqMainState: dqMainState,
                                        dqSceneType: dqSceneType) {
            willPress(button)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
    
    func getWillPress(dqMainState: DQMainState,
                      dqSceneType: DQSceneType) -> WillPress? {
        var willPress: WillPress?
        
        if dqMainState == .select_adventure_log {
            willPress = self.adventureLogScene?.willPress
            
            return willPress
        }
        
        switch dqSceneType {
        case .opening: break
        case .aliahan_town: willPress = self.aliahanTownScene?.willPress
        case .aliahan_town_house: willPress = self.aliahanTownHouseScene?.willPress
        }
        
        return willPress
    }
}

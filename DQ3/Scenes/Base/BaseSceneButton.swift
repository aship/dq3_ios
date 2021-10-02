//
//  BaseSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseScene {
    func willPress(_ button: ButtonOverlay) {
        let dqSceneType = DataManager.adventureLog.dqSceneType
        
        if dqSceneType == .opening {
            return
        }
        
        if let willPress = getWillPress(dqSceneType: dqSceneType) {
            willPress(button)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
    
    func getWillPress(dqSceneType: DQSceneType) -> WillPress? {
        var willPress: WillPress?
        
        switch dqSceneType {
        case .title: break
        case .adventure_log: willPress = self.adventureLogScene?.willPress
        case .opening: break
        case .battle: willPress = self.battleScene?.willPress
        case .field: willPress = self.fieldScene?.willPress
        case .alefgard: willPress = self.alefgardScene?.willPress
        case .aliahan_town: willPress = self.aliahanTownScene?.willPress
        case .aliahan_town_house: willPress = self.aliahanTownHouseScene?.willPress
        case .alltrades_abbey: willPress = self.alltradesAbbeyScene?.willPress
        }
        
        return willPress
    }
}

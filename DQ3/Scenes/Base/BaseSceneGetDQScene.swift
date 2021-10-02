//
//  BaseSceneGetDQScene.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension BaseScene {
    func getDQScene(dqSceneType: DQSceneType) -> DQScene {
        var dqScene: DQScene!
        
        switch dqSceneType {
        case .title: dqScene = self.titleScene
        case .adventure_log: dqScene = self.adventureLogScene
        case .battle: dqScene = self.battleScene
        case .opening: break
        case .field: break
        case .alefgard: break
        case .aliahan_town: break
        case .aliahan_town_house: break
        case .alltrades_abbey: break
        }
        
        return dqScene
    }
    
    func getDQMapScene(dqSceneType: DQSceneType) -> DQMapScene? {
        var dqMapScene: DQMapScene?
        
        switch dqSceneType {
        case .title: break
        case .adventure_log: break
        case .battle: break
        case .opening: dqMapScene = self.openingScene
        case .field: dqMapScene = self.fieldScene
        case .alefgard: dqMapScene = self.alefgardScene
        case .aliahan_town: dqMapScene = self.aliahanTownScene
        case .aliahan_town_house: dqMapScene = self.aliahanTownHouseScene
        case .alltrades_abbey: dqMapScene = self.alltradesAbbeyScene
        }
        
        return dqMapScene
    }
}

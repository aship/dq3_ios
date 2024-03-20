//
//  BaseSceneGetDQMapScene.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension BaseScene {
    func getDQMapScene(dqSceneType: DQSceneType) -> DQMapScene? {
        var dqMapScene: DQMapScene?

        switch dqSceneType {
        case .opening: dqMapScene = self.openingScene
        case .aliahan_town: dqMapScene = self.aliahanTownScene
        case .aliahan_town_house: dqMapScene = self.aliahanTownHouseScene
        }

        return dqMapScene
    }
}

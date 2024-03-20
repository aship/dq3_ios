//
//  BaseMapSceneDQMapScene.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension BaseMapScene {
    func setupDQMapScene(dqSceneType: DQSceneType) {
        switch dqSceneType {
        case .opening:
            self.openingScene = OpeningScene(scene: self)
            self.openingScene.setup()
        case .aliahan_town:
            self.aliahanTownScene = AliahanTownScene(scene: self)
            self.aliahanTownScene.setup()
        case .aliahan_town_house:
            self.aliahanTownHouseScene = AliahanTownHouseScene(scene: self)
            self.aliahanTownHouseScene.setup()
        }
    }

    func getDQMapScene(dqSceneType: DQSceneType) -> DQMapScene {
        var dqMapScene: DQMapScene!

        switch dqSceneType {
        case .opening: dqMapScene = self.openingScene
        case .aliahan_town: dqMapScene = self.aliahanTownScene
        case .aliahan_town_house: dqMapScene = self.aliahanTownHouseScene
        }

        return dqMapScene
    }
}

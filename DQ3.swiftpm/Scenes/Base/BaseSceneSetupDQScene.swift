//
//  BaseSceneSetupDQScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func setupDQScene(
        dqMainState: DQMainState?,
        dqSceneType: DQSceneType?
    ) {
        if dqMainState == .title {
            self.titleScene = TitleScene(scene: self)
            self.titleScene?.setup()

            return
        } else if dqMainState == .select_adventure_log {
            self.adventureLogScene = AdventureLogScene(scene: self)
            self.adventureLogScene?.setup()

            return
        }

        switch dqSceneType {
        case .opening:
            self.openingScene = OpeningScene(scene: self)
            self.openingScene?.setup()
        case .aliahan_town:
            self.aliahanTownScene = AliahanTownScene(scene: self)
            self.aliahanTownScene?.setup()
        case .aliahan_town_house:
            self.aliahanTownHouseScene = AliahanTownHouseScene(scene: self)
            self.aliahanTownHouseScene?.setup()
        case .none: break
        }
    }
}
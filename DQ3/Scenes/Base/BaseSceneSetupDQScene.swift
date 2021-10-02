//
//  BaseSceneSetupDQScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func setupDQScene(dqSceneType: DQSceneType) {
        DataManager.adventureLog.dqSceneType = dqSceneType
        
        switch dqSceneType {
        case .title:
            self.titleScene = TitleScene(scene: self)
            self.titleScene?.setup()
        case .adventure_log:
            self.adventureLogScene = AdventureLogScene(scene: self)
            self.adventureLogScene?.setup()
        case .opening:
            self.openingScene = OpeningScene(scene: self)
            self.openingScene?.setup()
        case .battle:
            self.battleScene = BattleScene(scene: self)
            self.battleScene?.setup()
        case .field:
            self.fieldScene = FieldScene(scene: self)
            self.fieldScene?.setup()
        case .aliahan_town:
            self.aliahanTownScene = AliahanTownScene(scene: self)
            self.aliahanTownScene?.setup()
        case .aliahan_town_house:
            self.aliahanTownHouseScene = AliahanTownHouseScene(scene: self)
            self.aliahanTownHouseScene?.setup()
        }
    }
}

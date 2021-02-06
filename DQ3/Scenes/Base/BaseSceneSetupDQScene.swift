//
//  BaseSceneSetupDQScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func setupDQScene(dqSceneType: DQSceneType) {
        switch dqSceneType {
        case .title:
            self.titleScene = TitleScene(scene: self,
                                         dqSceneType: .title)
            self.titleScene.setup()
        case .adventure_log:
            self.adventureLogScene = AdventureLogScene(scene: self,
                                                       dqSceneType: .adventure_log)
            self.adventureLogScene.setup()
        case .opening:
            self.openingScene = OpeningScene(scene: self,
                                             dqSceneType: .opening)
            self.openingScene.setup()
        case .battle:
            self.battleScene = BattleScene(scene: self,
                                           dqSceneType: .battle)
            self.battleScene.setup()
        case .field:
            self.fieldScene = FieldScene(scene: self,
                                         dqSceneType: .field)
            self.fieldScene.setup()
        case .alefgard:
            self.alefgardScene = AlefgardScene(scene: self,
                                               dqSceneType: .alefgard)
            self.alefgardScene.setup()
        case .aliahan_town:
            self.aliahanTownScene = AliahanTownScene(scene: self,
                                                     dqSceneType: .aliahan_town)
            self.aliahanTownScene.setup()
            DataManager.aliahanTownScene = self.aliahanTownScene
        case .aliahan_town_house:
            self.aliahanTownHouseScene = AliahanTownHouseScene(scene: self,
                                                               dqSceneType: .aliahan_town_house)
            self.aliahanTownHouseScene.setup()
        }
    }
}

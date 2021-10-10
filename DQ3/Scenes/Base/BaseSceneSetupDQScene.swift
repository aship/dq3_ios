//
//  BaseSceneSetupDQScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func setupDQScene(dqMainState: DQMainState?,
                      dqSceneType: DQSceneType?) {
        if dqMainState == .title {
            self.titleScene = TitleScene(scene: self)
            self.titleScene?.setup()
            
            return
        }
        else if dqMainState == .select_adventure_log {
            self.adventureLogScene = AdventureLogScene(scene: self)
            self.adventureLogScene?.setup()
            
            return
        }
        
        DataManager.adventureLog.dqSceneType = dqSceneType!
        
        switch dqSceneType {
        case .opening:
            self.openingScene = OpeningScene(scene: self)
            self.openingScene?.setup()
        case .aliahan_town_house:
            self.aliahanTownHouseScene = AliahanTownHouseScene(scene: self)
            self.aliahanTownHouseScene?.setup()
        case .aliahan_town:
            self.aliahanTownScene = AliahanTownScene(scene: self)
            self.aliahanTownScene?.setup()
            DataManager.aliahanTownScene = self.aliahanTownScene
        case .field:
            self.fieldScene = FieldScene(scene: self)
            
            var dqAudio: DQAudio = .field
            
            if self.fieldMoveMode == .ship {
                dqAudio = .ship
            }
            
            self.fieldScene?.setup(dqAudio: dqAudio)
            
            self.fieldScene?.addNightOverlay()
        case .alltrades_abbey:
            self.alltradesAbbeyScene = AlltradesAbbeyScene(scene: self)
            self.alltradesAbbeyScene?.setup()
        case .alefgard:
            self.alefgardScene = AlefgardScene(scene: self)
            
            var dqAudio: DQAudio = .alefgard
            
            if self.fieldMoveMode == .ship {
                dqAudio = .ship
            }
            
            self.alefgardScene?.setup(dqAudio: dqAudio)
        case .battle:
            self.battleScene = BattleScene(scene: self)
            self.battleScene?.setup()
        case .none: break
        }
    }
}

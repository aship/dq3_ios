//
//  BaseSceneDQSceneFunction.swift
//  DQ3
//
//  Created by aship on 2021/01/26.
//

import SpriteKit

extension BaseScene {
    func getCheckCanMove(dqSceneType: DQSceneType) -> CheckCanMove? {
        var checkCanMove: CheckCanMove?

        switch dqSceneType {
        case .opening: break
        case .aliahan_town: checkCanMove = self.aliahanTownScene?.checkCanMove
        case .aliahan_town_house: checkCanMove = self.aliahanTownHouseScene?.checkCanMove
        case .field: checkCanMove = self.fieldScene?.checkCanMove
        case .alltrades_abbey: checkCanMove = self.alltradesAbbeyScene?.checkCanMove
        case .alefgard: checkCanMove = self.alefgardScene?.checkCanMove
        case .battle: break
        }

        return checkCanMove
    }

    func getCheckPosition(dqSceneType: DQSceneType) -> CheckPosition? {
        var checkPosition: CheckPosition?

        switch dqSceneType {
        case .opening: break
        case .aliahan_town: checkPosition = self.aliahanTownScene?.checkPosition
        case .aliahan_town_house: checkPosition = self.aliahanTownHouseScene?.checkPosition
        case .field: checkPosition = self.fieldScene?.checkPosition
        case .alltrades_abbey: checkPosition = self.alltradesAbbeyScene?.checkPosition
        case .alefgard: checkPosition = self.alefgardScene?.checkPosition
        case .battle: break
        }

        return checkPosition
    }
}

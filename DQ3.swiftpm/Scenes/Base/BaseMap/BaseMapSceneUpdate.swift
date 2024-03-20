//
//  BaseMapSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseMapScene {
    override func update(_ currentTime: TimeInterval) {
        let dqSceneType = DataManager.dqSceneType

        if dqSceneType == .opening {
            return
        }

        let tileMapNode = getTileMapNode(dqSceneType: dqSceneType)
        let checkCanMove = getCheckCanMove(dqSceneType: dqSceneType)
        let checkPosition = getCheckPosition(dqSceneType: dqSceneType)

        processUpdate(
            padDirection: self.padDirection,
            tileMapNode: tileMapNode,
            characterNodes: DataManager.adventureLog.partyCharacterNodes,
            queueFollowDirections: &DataManager.queueFollowDirections,
            dqSceneType: DataManager.dqSceneType,
            scale: self.scale,
            checkCanMove: checkCanMove,
            completion: { newPositionX, newPositionY in
                checkPosition(
                    newPositionX,
                    newPositionY)
            })
    }

    func getCheckCanMove(dqSceneType: DQSceneType) -> CheckCanMove {
        var checkCanMove: CheckCanMove!

        switch dqSceneType {
        case .opening: break
        case .aliahan_town: checkCanMove = self.aliahanTownScene.checkCanMove
        case .aliahan_town_house: checkCanMove = self.aliahanTownHouseScene.checkCanMove
        }

        return checkCanMove
    }

    func getCheckPosition(dqSceneType: DQSceneType) -> CheckPosition {
        var checkPosition: CheckPosition!

        switch dqSceneType {
        case .opening: break
        case .aliahan_town: checkPosition = self.aliahanTownScene.checkPosition
        case .aliahan_town_house: checkPosition = self.aliahanTownHouseScene.checkPosition
        }

        return checkPosition
    }
}

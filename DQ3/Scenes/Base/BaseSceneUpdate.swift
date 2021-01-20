//
//  BaseSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseScene {
    override func update(_ currentTime: TimeInterval) {
        let dqSceneType = DataManager.dqSceneType
        
        if dqSceneType == .title ||
            dqSceneType == .adventure_log ||
            dqSceneType == .opening ||
            dqSceneType == .battle {
            return
        }
        
        let checkCanMove = getCheckCanMove(dqSceneType: dqSceneType)
        let checkPosition = getCheckPosition(dqSceneType: dqSceneType)
        let dqMapScene = getDQMapScene(dqSceneType: dqSceneType)
        
        processUpdate(padDirection: self.padDirection,
                      tileMapNode: dqMapScene.mainTileMapNode,
                      characterNodes: DataManager.characterNodes,
                      queueFollowDirections: &DataManager.queueFollowDirections,
                      dqSceneType: DataManager.dqSceneType,
                      scale: self.scale,
                      checkCanMove: checkCanMove,
                      completion: { newPositionX, newPositionY in
                        print("x: \(newPositionX), y: \(newPositionY)")
                        
                        checkPosition(newPositionX,
                                      newPositionY)
                      })
    }
    
    func getCheckCanMove(dqSceneType: DQSceneType) -> CheckCanMove {
        var checkCanMove: CheckCanMove!
        
        switch dqSceneType {
        case .title: break
        case .adventure_log: break
        case .opening: break
        case .battle: break
        case .field: checkCanMove = self.fieldScene.checkCanMove
        case .aliahan_town: checkCanMove = self.aliahanTownScene.checkCanMove
        case .aliahan_town_house: checkCanMove = self.aliahanTownHouseScene.checkCanMove
        }
        
        return checkCanMove
    }
    
    func getCheckPosition(dqSceneType: DQSceneType) -> CheckPosition {
        var checkPosition: CheckPosition!
        
        switch dqSceneType {
        case .title: break
        case .adventure_log: break
        case .opening: break
        case .battle: break
        case .field: checkPosition = self.fieldScene.checkPosition
        case .aliahan_town: checkPosition = self.aliahanTownScene.checkPosition
        case .aliahan_town_house: checkPosition = self.aliahanTownHouseScene.checkPosition
        }
        
        return checkPosition
    }
}

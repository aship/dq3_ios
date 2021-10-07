//
//  BaseSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseScene {
    override func update(_ currentTime: TimeInterval) {
        let dqMainState = DataManager.dqMainState
        
        if dqMainState == .title ||
            dqMainState == .select_adventure_log {
            return
        }
        
        let dqSceneType = DataManager.adventureLog.dqSceneType
        let dqMapScene = self.getDQMapScene(dqSceneType: dqSceneType)
        let checkCanMove = getCheckCanMove(dqSceneType: dqSceneType)
        let checkPosition = getCheckPosition(dqSceneType: dqSceneType)
        
        let tileMapNode = dqMapScene?.mainTileMapNode
        
        if tileMapNode == nil {
            return
        }
        
        processUpdate(padDirection: self.padDirection,
                      tileMapNode: tileMapNode!,
                      characterNodes: DataManager.adventureLog.partyCharacterNodes,
                      queueFollowDirections: &DataManager.queueFollowDirections,
                      dqSceneType: dqSceneType,
                      scale: self.scale,
                      checkCanMove: checkCanMove,
                      completion: { newPositionX, newPositionY in
            print("x: \(newPositionX), y: \(newPositionY)")
            
            checkPosition!(newPositionX,
                           newPositionY)
        })
    }
}

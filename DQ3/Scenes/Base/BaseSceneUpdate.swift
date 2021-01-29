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
        
        let dqMapScene = self.getDQMapScene(dqSceneType: dqSceneType)
        
        if dqMapScene.mapCommandWindowNode.isOpen {
            dqMapScene.mapCommandWindowNode.moveTriangle(direction: self.padDirection)
        }
        else {
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
    }
}

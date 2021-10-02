//
//  BaseSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension BaseScene {
    override func update(_ currentTime: TimeInterval) {
        let dqSceneType = DataManager.adventureLog.dqSceneType
        
        if dqSceneType == .title ||
            dqSceneType == .opening ||
            dqSceneType == .battle {
            return
        }
        
        if dqSceneType == .adventure_log {
            let adventureLogTopWindowNode = self.adventureLogScene?.adventureLogTopWindowNode
            adventureLogTopWindowNode?.moveTriangle(direction: self.padDirection)
            
            return
        }
        
        let dqMapScene = self.getDQMapScene(dqSceneType: dqSceneType)
        
        if let mapCommandWindowNode = dqMapScene?.mapCommandWindowNode {
            if mapCommandWindowNode.parent != nil {
                mapCommandWindowNode.moveTriangle(direction: self.padDirection)
                
                return
            }
        }
        
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

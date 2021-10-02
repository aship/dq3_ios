//
//  BaseMapSceneTransitionBattle.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseMapScene {
    func transitionToBattle() {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        headNode.setMoveProhibited()
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.5)
        AudioManager.stop()
        
        self.blackScreenNode.run(actionFadeOut, completion: {
            for node in DataManager.adventureLog.partyCharacterNodes {
                node.removeFromParent()
            }
            
            let dqMapScene = self.getDQMapScene(dqSceneType: DataManager.dqSceneType)
            dqMapScene.mainTileMapNode.removeFromParent()
            dqMapScene.insideTileMapNode?.removeFromParent()
            
            self.setupBattle()
            
            self.blackScreenNode.run(actionFadeIn)
        })
    }
}

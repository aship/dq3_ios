//
//  BaseSceneTransitionBattle.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func transitionToBattle() {
        // バトルから戻る時の Scene を記録
        DataManager.dqSceneTypeFromBattle = DataManager.dqSceneType
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.5)
        AudioManager.stop()
        
        self.blackScreenNode.run(actionFadeOut, completion: {
            for node in DataManager.characterNodes {
                node.removeFromParent()
            }
            
            let dqMapScene = self.getDQMapScene(dqSceneType: DataManager.dqSceneType)
            dqMapScene.mainTileMapNode.removeFromParent()
            dqMapScene.insideTileMapNode?.removeFromParent()
            
            self.setupDQScene(dqSceneType: .battle)
            
            self.blackScreenNode.run(actionFadeIn)
        })
    }
}

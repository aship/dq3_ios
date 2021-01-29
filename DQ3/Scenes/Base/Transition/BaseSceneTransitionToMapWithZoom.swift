//
//  BaseSceneTransitionToMapWithZoom.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension BaseScene {
    // Zoom (ルーラ) で移動
    func transitionToMapWithZoom(dqSceneType: DQSceneType,
                                 dqAudio: DQAudio) {        
        let actionWait05 = SKAction.wait(forDuration: 0.5)
        
        let actionAudioStop = SKAction.run({
            AudioManager.stop()
        })
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        let actionAudioSe = SKAction.run({
            self.playSoundEffect(.spell)
        })
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.5)
        
        let sequence1 = SKAction.sequence([actionWait05,
                                           actionAudioStop])
        
        let sequence2 = SKAction.sequence([actionAudioSe,
                                           actionWait05,
                                           actionFadeIn])
        self.run(sequence1, completion: {
            self.blackScreenNode.run(actionFadeOut, completion: {
                for node in DataManager.characterNodes {
                    node.removeFromParent()
                    node.isPaused = false
                }
                
                let dqMapScene = self.getDQMapScene(dqSceneType: DataManager.dqSceneType)
                dqMapScene.mainTileMapNode.removeFromParent()
                dqMapScene.insideTileMapNode?.removeFromParent()
                
                dqMapScene.mapCommandWindowNode.close()
                dqMapScene.mapMessageWindowNode.close()
                
                self.setupDQScene(dqSceneType: dqSceneType)
                
                self.blackScreenNode.run(sequence2, completion: {
                    AudioManager.play(dqAudio: dqAudio)
                    
                    for node in DataManager.characterNodes {
                        node.setMovePermitted()
                    }
                })
            })
        })
    }
}

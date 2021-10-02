//
//  BaseSceneTransitionToMapWithStairs.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func transitionToMapWithStairs(dqSceneTypeFrom: DQSceneType,
                                   dqSceneTypeTo: DQSceneType,
                                   dqAudio: DQAudio) {
        var shouldStopAudio = false
        var shouldPlayAudio = false
        
        if AudioManager.getDqAudio() != dqAudio {
            // 違う曲
            shouldStopAudio = true
            shouldPlayAudio = true
        }
        
        let actionWait05 = SKAction.wait(forDuration: 0.5)
        
        let actionAudioStop = SKAction.run({
            if shouldStopAudio {
                AudioManager.stop()
            }
        })
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        let actionAudioSe = SKAction.run({
            SoundEffectManager.play(.stairs)
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
                for node in DataManager.adventureLog.partyCharacterNodes {
                    node.removeFromParent()
                }
                
                let dqMapScene = self.getDQMapScene(dqSceneType: dqSceneTypeFrom)
                dqMapScene?.mainTileMapNode.removeFromParent()
                dqMapScene?.insideTileMapNode?.removeFromParent()
                dqMapScene?.characterNpcNodes = []
                
                self.setupDQScene(dqSceneType: dqSceneTypeTo)
                
                self.blackScreenNode.run(sequence2, completion: {
                    if shouldPlayAudio {
                        AudioManager.play(dqAudio: dqAudio)
                    }
                })
            })
        })
    }
}

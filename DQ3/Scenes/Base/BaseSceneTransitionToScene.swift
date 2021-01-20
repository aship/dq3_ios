//
//  BaseSceneTransitionToScene.swift
//  DQ3
//
//  Created by aship on 2021/01/04.
//

import SpriteKit

extension BaseScene {
    func transitionToScene(dqSceneType: DQSceneType,
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
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.25)
        
        let sequence1 = SKAction.sequence([actionWait05,
                                           actionAudioStop])
        
        self.run(sequence1, completion: {
            self.blackScreenNode.run(actionFadeOut, completion: {
                self.setupDQScene(dqSceneType: dqSceneType)
                
                self.blackScreenNode.run(actionFadeIn, completion: {
                    if shouldPlayAudio {
                        AudioManager.play(dqAudio: dqAudio)
                    }
                })
            })
        })
    }
}

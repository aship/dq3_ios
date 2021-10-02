//
//  BaseSceneTransitionToMap.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func transitionToMap(dqSceneTypeFrom: DQSceneType,
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
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.25)
        
        let sequence = SKAction.sequence([actionWait05,
                                          actionAudioStop])
        
        self.run(sequence, completion: {
            self.blackScreenNode.run(actionFadeOut, completion: {
                if dqSceneTypeFrom == .adventure_log {
                    let adventureLogTopWindowNode = DataManager.scene.adventureLogScene?.adventureLogTopWindowNode
                    adventureLogTopWindowNode?.removeFromParent()
                }
                
                self.setupDQScene(dqSceneType: dqSceneTypeTo)
                
                self.blackScreenNode.run(actionFadeIn, completion: {
                    if shouldPlayAudio {
                        AudioManager.play(dqAudio: dqAudio)
                    }
                })
            })
        })
    }
}

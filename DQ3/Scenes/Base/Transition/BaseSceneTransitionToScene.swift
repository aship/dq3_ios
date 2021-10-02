//
//  BaseSceneTransitionToScene.swift
//  DQ3
//
//  Created by aship on 2021/01/04.
//

import SpriteKit

extension BaseScene {
    func transitionToScene(dqSceneType: DQSceneType) {
        let actionWait05 = SKAction.wait(forDuration: 0.5)
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.25)
        
        self.run(actionWait05, completion: {
            self.blackScreenNode.run(actionFadeOut, completion: {
                self.setupDQScene(dqSceneType: dqSceneType)
                
                self.blackScreenNode.run(actionFadeIn)
            })
        })
    }
}

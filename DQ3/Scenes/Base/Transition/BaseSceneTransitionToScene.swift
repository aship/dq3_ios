//
//  BaseSceneTransitionToScene.swift
//  DQ3
//
//  Created by aship on 2021/01/04.
//

import SpriteKit

extension BaseScene {
    func transitionToScene(dqMainState: DQMainState?,
                           dqSceneType: DQSceneType?) {
        let actionWait = SKAction.wait(forDuration: 0.5)
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.25)
        
        Task {
            await self.run(actionWait)
            await self.blackScreenNode.run(actionFadeOut)
            
            self.setupDQScene(dqMainState: dqMainState,
                              dqSceneType: dqSceneType)
            
            await self.blackScreenNode.run(actionFadeIn)
        }
    }
}

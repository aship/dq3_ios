//
//  BaseSceneTransitionFromBattle.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension BaseScene {
    func transitionFromBattle(dqSceneType: DQSceneType,
                              dqAudio: DQAudio) {
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.5)
        
        self.blackScreenNode.run(actionFadeOut, completion: {
            let battleScene = self.getDQScene(dqSceneType: .battle) as! BattleScene
            battleScene.messageWindowNode.removeFromParent()
            battleScene.commandWindowNode.removeFromParent()
            battleScene.statusWindowNode.removeFromParent()
            battleScene.targetWindowNode.removeFromParent()
            battleScene.labelNode.removeFromParent()
            battleScene.nodeSlime.removeFromParent()
            battleScene.nodeIkkaku.removeFromParent()
            
            self.setupDQScene(dqSceneType: dqSceneType)
            
            self.blackScreenNode.run(actionFadeIn)
        })
    }
}

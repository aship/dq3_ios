//
//  BaseMapSceneTransitionFromBattle.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

extension BaseMapScene {
    func transitionFromBattle(dqSceneType: DQSceneType,
                              dqAudio: DQAudio) {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        headNode.setMoveProhibited()
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                              duration: 0.5)
        
        self.blackScreenNode.run(actionFadeOut, completion: {            
            let battleScene = self.getBattleScene()
            battleScene.messageWindowNode.removeFromParent()
            battleScene.commandWindowNode.removeFromParent()
            battleScene.statusWindowNode.removeFromParent()
            battleScene.targetWindowNode.removeFromParent()
            
            battleScene.labelNode.removeFromParent()
            
            battleScene.nodeSlime.removeFromParent()
            battleScene.nodeIkkaku.removeFromParent()
            
            self.setupDQMapScene(dqSceneType: dqSceneType)
            
            self.blackScreenNode.run(actionFadeIn)
        })
    }
}

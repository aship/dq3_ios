//
//  TitleScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class TitleScene: DQScene {
    let nodeTitle = SKSpriteNode(imageNamed: "title.png")
    
    func setup() {
        DataManager.adventureLog.dqSceneType = .title
        
        self.scene.backgroundColor = .black
        
        self.scene.leftPad.isHidden = true
        self.scene.buttonA.isHidden = true
        self.scene.buttonB.isHidden = true
        
        self.nodeTitle.setScale(self.scene.scale)
        self.nodeTitle.alpha = 0
        
        self.scene.addChild(nodeTitle)
        
        let actionFadeIn = SKAction.fadeIn(withDuration: 1.0)
        let actionWait = SKAction.wait(forDuration: 1.0)
        let actionFadeOut = SKAction.fadeOut(withDuration: 1.0)
        
        let actions = SKAction.sequence([actionFadeIn,
                                         actionWait,
                                         actionFadeOut])
        self.nodeTitle.run(actions)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.scene.transitionToScene(dqSceneType: .adventure_log)
        }
    }
}

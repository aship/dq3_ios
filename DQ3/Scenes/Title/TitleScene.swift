//
//  TitleScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class TitleScene: SKScene {
    let scale = CGFloat(ScreenHeight / 224)
    
    let nodeTitle = SKSpriteNode(imageNamed: "title.png")
    
    override func sceneDidLoad() {
        self.scaleMode = .resizeFill
        self.anchorPoint = CGPoint(x: 0.5,
                                   y: 0.5)
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        self.nodeTitle.setScale(self.scale)
        self.nodeTitle.alpha = 0
        
        self.addChild(nodeTitle)
        
        let actionFadeIn = SKAction.fadeIn(withDuration: 1.0)
        let actionWait = SKAction.wait(forDuration: 1.0)
        let actionFadeOut = SKAction.fadeOut(withDuration: 1.0)
        
        let actions = SKAction.sequence([actionFadeIn,
                                         actionWait,
                                         actionFadeOut])
        self.nodeTitle.run(actions)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let scene = AdventureLogScene()
            let transition = SKTransition.crossFade(withDuration: 0.0)
            
            self.view?.presentScene(scene,
                                    transition: transition)
        }
    }
}

//
//  AdventureLogTopWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogTopWindowNode {
    func processButtonA() {
        self.parentScene?.setProcessing()
        
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        SoundEffectManager.play(.command)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let scene = OpeningScene()
            
            let transition = SKTransition.crossFade(withDuration: 0.5)
            self.parentScene?.view?.presentScene(scene,
                                                 transition: transition)
        }
    }
}

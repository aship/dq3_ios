//
//  AdventureLogSelectGenderWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/17.
//

import SpriteKit

extension AdventureLogSelectGenderWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        let dqAdventureLogTop = self.dqAdventureLogTop!
        
        if dqAdventureLogTop == .create {
            if let adventureLogMessageSpeedWindowNode = self.adventureLogMessageSpeedWindowNode {
                adventureLogMessageSpeedWindowNode.processButtonA()
                
                return
            }
        }
        
        SoundEffectManager.play(.command)
        
        self.adventureLogMessageSpeedWindowNode = AdventureLogMessageSpeedWindowNode(
            dqAdventureLogTop: dqAdventureLogTop,
            adventureLogNumber: adventureLogNumber)
        self.adventureLogMessageSpeedWindowNode?.addToWindow(windowNode: self)
    }
}

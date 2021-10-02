//
//  AdventureLogTopWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogTopWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        if dqAdventureLogTop == .go ||
            dqAdventureLogTop == .change_message_speed ||
            dqAdventureLogTop == .copy ||
            dqAdventureLogTop == .delete {
            if let adventureLogSelectLogWindowNode = self.adventureLogSelectLogWindowNode {
                adventureLogSelectLogWindowNode.processButtonA()
                
                return
            }
        }
        
        if dqAdventureLogTop == .create  {
            if let adventureLogSelectEmptyLogWindowNode = self.adventureLogSelectEmptyLogWindowNode {
                adventureLogSelectEmptyLogWindowNode.processButtonA()
                
                return
            }
        }
        
        SoundEffectManager.play(.command)
        
        let dqAdventureLogTop = self.dqAdventureLogTop!
        
        if dqAdventureLogTop != .change_message_speed &&
            dqAdventureLogTop != .create {
            pauseTriangleAnimation(triangleNode: self.triangleNode)
        }
        
        if dqAdventureLogTop == .go ||
            dqAdventureLogTop == .change_message_speed ||
            dqAdventureLogTop == .copy ||
            dqAdventureLogTop == .delete {
            self.adventureLogSelectLogWindowNode = AdventureLogSelectLogWindowNode(dqAdventureLogTop: dqAdventureLogTop)
            self.adventureLogSelectLogWindowNode?.addToWindow(windowNode: self)
        }
        else if dqAdventureLogTop == .create {
            self.adventureLogSelectEmptyLogWindowNode = AdventureLogSelectEmptyLogWindowNode(dqAdventureLogTop: dqAdventureLogTop,
                                                                                             adventureLogNumber: nil)
            self.adventureLogSelectEmptyLogWindowNode?.addToWindow(windowNode: self)
        }
    }
}

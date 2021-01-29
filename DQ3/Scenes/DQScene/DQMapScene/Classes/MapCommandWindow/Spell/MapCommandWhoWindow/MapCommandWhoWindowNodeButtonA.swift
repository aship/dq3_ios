//
//  MapCommandWhoWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

extension MapCommandWhoWindowNode {
    func processButtonA() {
        if mapCommandSpellWindowNode.isOpen {
            mapCommandSpellWindowNode.processButtonA()
            
            return
        }
        
        SoundEffectManager.play(.command)
        pauseTriangleAnimation(triangleNode: self.triangleNode)

        mapCommandSpellWindowNode = MapCommandSpellWindowNode()
        mapCommandSpellWindowNode.addToWindow(windowNode: self,
                                            scale: 1)
    }
}

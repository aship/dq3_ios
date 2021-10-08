//
//  MapCommandWindowNodeSpell.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension MapCommandWindowNode {
    func processSpellButtonA() {
        if let mapCommandWhoWindowNode = self.mapCommandWhoWindowNode {
            mapCommandWhoWindowNode.processButtonA()
            
            return
        }
        
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        self.mapCommandWhoWindowNode = MapCommandWhoWindowNode()
        self.mapCommandWhoWindowNode?.addToWindow(windowNode: self)
    }
}

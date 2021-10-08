//
//  MapCommandWindowNodeSpell.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension MapCommandWindowNode {
    internal func processSpellButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        self.spellMessageWindowNode = SpellMessageWindowNode()
        self.spellMessageWindowNode?.addToNode(
            node: self,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY,
            scale: 1)
        
        self.spellMessageWindowNode?.processButtonA()
    }
}

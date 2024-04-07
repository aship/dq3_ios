//
//  MapCommandWhoWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

extension MapCommandWhoWindowNode {
    func processButtonA() {
        if let mapCommandSpellWindowNode = self.mapCommandSpellWindowNode {
            mapCommandSpellWindowNode.processButtonA()

            return
        }

        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)

        self.mapCommandSpellWindowNode = MapCommandSpellWindowNode()
        self.mapCommandSpellWindowNode?.addToWindow(
            windowNode: self,
            scale: 1)
    }
}

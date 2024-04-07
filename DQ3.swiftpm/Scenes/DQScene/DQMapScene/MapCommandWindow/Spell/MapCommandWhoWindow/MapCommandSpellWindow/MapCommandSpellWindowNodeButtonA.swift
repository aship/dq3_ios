//
//  MapCommandSpellWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

extension MapCommandSpellWindowNode {
    func processButtonA() {
        if mapCommandZoomWindowNode.isOpen {
            mapCommandZoomWindowNode.processButtonA()
            return
        }

        SoundEffectManager.play(.command)
        pauseTriangleAnimation(triangleNode: self.triangleNode)

        if self.dqSpell == .zoom {
            mapCommandZoomWindowNode = MapCommandZoomWindowNode()
            mapCommandZoomWindowNode.delegate = self
            mapCommandZoomWindowNode.addToWindow(
                page: 0,
                initialPage: true,
                windowNode: self,
                scale: 1)
        } else {
            let name = getSpellNameFrom(dqSpell: self.dqSpell)

            let text1 = "えにくすは　\(name)をとなえた！"

            mapMessageWindowNode = MapMessageWindowNode()
            mapMessageWindowNode.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {})
        }
    }

    func doSomething(page: Int) {
        mapCommandZoomWindowNode = MapCommandZoomWindowNode()
        mapCommandZoomWindowNode.delegate = self
        mapCommandZoomWindowNode.addToWindow(
            page: page,
            initialPage: false,
            windowNode: self,
            scale: 1)
    }
}

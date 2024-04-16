//
//  MapMessageWindowNodeMessage.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension MapMessageWindowNode {
    func showMessage(
        string: String,
        line: Int,
        withSe: Bool
    ) async {
        let BaseX = 8
        let BaseY = -24 - 16 * line

        if withSe {
            MessageSoundManager.play()
        }

        var arrLine: [SKSpriteNode] = []
        var actions: [SKAction] = []

        for (index, letter) in string.enumerated() {
            let node = DQFont.getFont(string: String(letter))
            node.position = CGPoint(
                x: BaseX + 8 * index,
                y: BaseY)
            node.alpha = 0
            self.addChild(node)

            arrLine.append(node)

            let actionFadeIn = SKAction.run({
                node.alpha = 1
            })

            let actionWait = SKAction.wait(forDuration: 1 / 32)

            actions.append(actionFadeIn)
            actions.append(actionWait)
        }

        self.arrLines.append(arrLine)

        let sequence = SKAction.sequence(actions)

        await self.run(sequence)
    }
}

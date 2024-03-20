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
            SoundEffectManager.play(.message)
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
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/MapMessageWindow/MapMessageWindowNodeShow.swift

            let actionFaceIn = SKAction.run({
========
            
            let actionFadeIn = SKAction.run({
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/MapMessageWindow/MapMessageWindowNodeMessage.swift
                node.alpha = 1
            })

            let actionWait = SKAction.wait(forDuration: 1 / 32)
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/MapMessageWindow/MapMessageWindowNodeShow.swift

            actions.append(actionFaceIn)
========
            
            actions.append(actionFadeIn)
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/MapMessageWindow/MapMessageWindowNodeMessage.swift
            actions.append(actionWait)
        }

        self.arrLines.append(arrLine)

        let sequence = SKAction.sequence(actions)

        await self.run(sequence)
    }
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/MapMessageWindow/MapMessageWindowNodeShow.swift

    func showNextMark(line: Int) {
        let BaseX = 8
        let BaseY = -24 - 16 * line
        let index = 9

        self.nextMark = DQFont.getFont(string: "▼")
        self.nextMark.position = CGPoint(
            x: BaseX + 8 * index,
            y: BaseY)

        self.addChild(self.nextMark)

        let imageName1 = "font/symbol/triangle_down"
        let texture1 = SKTexture(imageNamed: imageName1)

        let imageName2 = "font/window/space"
        let texture2 = SKTexture(imageNamed: imageName2)

        let textures = [texture1, texture2]

        let action = SKAction.animate(
            with: textures,
            timePerFrame: 1 / 4)

        let repeatAction = SKAction.repeatForever(action)

        self.nextMark.run(repeatAction)
    }
========
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/MapMessageWindow/MapMessageWindowNodeMessage.swift
}

//
//  TalkMessageLuidaWishWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/05/07.
//

import SpriteKit

extension TalkMessageLuidaWishWindowNode {
    func moveTriangle(direction: Direction) {
        if self.triangleMoving == true {
            return
        }

        if direction == .neutral {
            return
        }

        let isValidDirection = getNextElement(
            direction: direction,
            element: &self.dqLuidaWish,
            elements: self.dqLuidaWishes)
        if !isValidDirection {
            return
        }

        let values = getDiffXY(direction: direction)
        let diffX: CGFloat = CGFloat(values.0 * 40)
        let diffY: CGFloat = CGFloat(values.1 * 16)

        self.triangleMoving = true

        let action = SKAction.moveBy(
            x: diffX,
            y: diffY,
            duration: 0)
        let waitAction = SKAction.wait(forDuration: 1 / 4)

        let sequence = SKAction.sequence([
            action,
            waitAction,
        ])
        Task {
            await self.triangleNode.run(sequence)

            self.triangleMoving = false
        }
    }
}

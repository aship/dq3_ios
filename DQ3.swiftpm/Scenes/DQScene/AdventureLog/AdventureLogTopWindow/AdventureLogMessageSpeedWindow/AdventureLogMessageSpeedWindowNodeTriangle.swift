//
//  AdventureLogMessageSpeedWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/04/17.
//

import SpriteKit

extension AdventureLogMessageSpeedWindowNode {
    func moveTriangle(direction: Direction) {
        if self.triangleMoving == true {
            return
        }

        if direction == .neutral {
            return
        }

        if direction == .up || direction == .down {
            return
        }

        if self.triangleIndex == 0 {
            if direction == .left {
                return
            }
        }

        if self.triangleIndex == 7 {
            if direction == .right {
                return
            }
        }

        let values = getDiffXY(direction: direction)
        let diffX: CGFloat = CGFloat(values.0 * 16)
        let diffY: CGFloat = CGFloat(values.1 * 16)

        self.triangleIndex += values.0
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
        self.triangleNode.run(
            sequence,
            completion: {
                self.triangleMoving = false
            })
    }
}

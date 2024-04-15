//
//  AdventureLogTopWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogTopWindowNode {
    func moveTriangle(direction: Direction) {
        if self.dqAdventureLogTop == .go || self.dqAdventureLogTop == .change_message_speed
            || self.dqAdventureLogTop == .copy || self.dqAdventureLogTop == .delete
        {
            if let adventureLogSelectLogWindowNode = self.adventureLogSelectLogWindowNode {
                adventureLogSelectLogWindowNode.moveTriangle(direction: direction)

                return
            }
        }

        if self.dqAdventureLogTop == .create {
            if let adventureLogSelectEmptyLogWindowNode = self.adventureLogSelectEmptyLogWindowNode
            {
                adventureLogSelectEmptyLogWindowNode.moveTriangle(direction: direction)

                return
            }
        }

        if self.triangleMoving == true {
            return
        }

        if direction == .neutral {
            return
        }

        let isValidDirection = getNextElement(
            direction: direction,
            element: &self.dqAdventureLogTop,
            elements: self.dqAdventureLogTops)
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
        self.triangleNode.run(
            sequence,
            completion: {
                self.triangleMoving = false
            })
    }
}

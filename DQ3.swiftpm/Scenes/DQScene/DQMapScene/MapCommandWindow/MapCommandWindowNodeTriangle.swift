//
//  MapCommandWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/01/19.
//

import SpriteKit

extension MapCommandWindowNode {
    func moveTriangle(direction: Direction) {
        if let talkMessageWindow = self.talkMessageWindowAliahanTown {
            let yesNoWindowNode = talkMessageWindow.aliahanTownTalkMessageYesNoWindowNode

            if yesNoWindowNode.isOpen {
                yesNoWindowNode.moveTriangle(direction: direction)

                return
            }
        }

        if self.triangleMoving == true {
            return
        }

        if direction == .neutral {
            return
        }

        if self.commandType == .talk {
            if direction == .down {
                self.commandType = .status
            } else if direction == .right {
                self.commandType = .spells
            } else {
                return
            }
        } else if self.commandType == .spells {
            if direction == .down {
                self.commandType = .items
            } else if direction == .left {
                self.commandType = .talk
            } else {
                return
            }
        } else if self.commandType == .status {
            if direction == .up {
                self.commandType = .talk
            } else if direction == .down {
                self.commandType = .equip
            } else if direction == .right {
                self.commandType = .items
            } else {
                return
            }
        } else if self.commandType == .items {
            if direction == .up {
                self.commandType = .spells
            } else if direction == .down {
                self.commandType = .search
            } else if direction == .left {
                self.commandType = .status
            } else {
                return
            }
        } else if self.commandType == .equip {
            if direction == .up {
                self.commandType = .status
            } else if direction == .right {
                self.commandType = .search
            } else {
                return
            }
        } else if self.commandType == .search {
            if direction == .up {
                self.commandType = .items
            } else if direction == .left {
                self.commandType = .equip
            } else {
                return
            }
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

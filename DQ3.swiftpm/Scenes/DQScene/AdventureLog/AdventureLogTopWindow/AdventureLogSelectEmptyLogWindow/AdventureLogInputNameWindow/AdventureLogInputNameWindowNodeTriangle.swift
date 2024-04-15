//
//  AdventureLogInputNameWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/04/16.
//

import SpriteKit

extension AdventureLogInputNameWindowNode {
    func moveTriangle(direction: Direction) {
        if let adventureLogSelectGenderWindowNode = self.adventureLogSelectGenderWindowNode {
            adventureLogSelectGenderWindowNode.moveTriangle(direction: direction)

            return
        }

        if self.triangleMoving == true {
            return
        }

        if direction == .neutral {
            return
        }

        if self.trianglePositionX == 0 {
            if direction == .left {
                return
            }
        } else if self.trianglePositionX == 9 {
            if direction == .right {
                return
            }
        }

        if self.trianglePositionY == 0 {
            if direction == .up {
                return
            }
        } else if self.trianglePositionY == 5 {
            if direction == .down {
                return
            }
        }

        var diffX: CGFloat = 0
        var diffY: CGFloat = 0

        var trianglePositionDiffX = 0
        var trianglePositionDiffY = 0

        var shouldReturn = false

        getDiff(
            direction: direction,
            diffX: &diffX,
            diffY: &diffY,
            trianglePositionX: self.trianglePositionX,
            trianglePositionY: self.trianglePositionY,
            trianglePositionDiffX: &trianglePositionDiffX,
            trianglePositionDiffY: &trianglePositionDiffY,
            shouldReturn: &shouldReturn)

        if shouldReturn {
            return
        }

        let values = getDiffXY(direction: direction)
        diffX += CGFloat(values.0 * 16)
        diffY += CGFloat(values.1 * 16)

        // trianglePosition は Y座標 下方向が + だが
        // getDiffXY は Y座標 下方向が - で
        // Y方向の + - が逆のため - にしてる
        self.trianglePositionX += values.0 + trianglePositionDiffX
        self.trianglePositionY += -values.1 + trianglePositionDiffY

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

    private func getDiff(
        direction: Direction,
        diffX: inout CGFloat,
        diffY: inout CGFloat,
        trianglePositionX: Int,
        trianglePositionY: Int,
        trianglePositionDiffX: inout Int,
        trianglePositionDiffY: inout Int,
        shouldReturn: inout Bool
    ) {
        if trianglePositionX == 4 && direction == .right {
            // 左ブロックから右ブロックに飛ぶ
            diffX += 8
        }

        if trianglePositionX == 5 && direction == .left {
            // 右ブロックから左ブロックに飛ぶ
            diffX -= 8
        }

        if trianglePositionX == 6 && trianglePositionY == 1 {
            if direction == .down {
                // "み"の時に、下にちょっと飛ぶ
                diffY -= 16
                trianglePositionDiffY += 1
            }
        }

        if trianglePositionX == 8 && trianglePositionY == 1 {
            if direction == .down {
                // "め"の時に、下にちょっと飛ぶ
                diffY -= 16
                trianglePositionDiffY += 1
            }
        }

        if trianglePositionX == 5 && trianglePositionY == 2 {
            if direction == .right {
                // "や"の時に、右にちょっと飛ぶ
                diffX += 16
                trianglePositionDiffX += 1
            }
        }

        if trianglePositionX == 7 && trianglePositionY == 2 {
            if direction == .right {
                // "ゆ"の時に、右にちょっと飛ぶ
                diffX += 16
                trianglePositionDiffX += 1
            } else if direction == .left {
                // "ゆ"の時に、左にちょっと飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            }
        }

        if trianglePositionX == 9 && trianglePositionY == 2 {
            if direction == .left {
                // "よ"の時に、左にちょっと飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            }
        }

        if trianglePositionX == 6 && trianglePositionY == 3 {
            if direction == .up {
                // "り"の時に、上にちょっと飛ぶ
                diffY += 16
                trianglePositionDiffY -= 1
            } else if direction == .down {
                // "り"の時に、下にちょっと飛ぶ
                diffY -= 16
                trianglePositionDiffY += 1
            }
        }

        if trianglePositionX == 8 && trianglePositionY == 3 {
            if direction == .up {
                // "れ"の時に、上にちょっと飛ぶ
                diffY += 16
                trianglePositionDiffY -= 1
            } else if direction == .down {
                // "れ"の時に、下にちょっと飛ぶ
                diffY -= 16
                trianglePositionDiffY += 1
            }
        }

        if trianglePositionX == 5 && trianglePositionY == 4 && direction == .right {
            // "わ"の時に、右にちょっと飛ぶ
            diffX += 16
            trianglePositionDiffX += 1
        }

        if trianglePositionX == 7 && trianglePositionY == 4 {
            if direction == .down {
                // "を"の時に、下は"もどる"に飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            } else if direction == .right {
                // "を"の時に、右にちょっと飛ぶ
                diffX += 16
                trianglePositionDiffX += 1
            } else if direction == .left {
                // "を"の時に、右にちょっと飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            }
        }

        if trianglePositionX == 9 && trianglePositionY == 4 {
            if direction == .down {
                // "ん"の時に、下は"おわり"に飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            } else if direction == .left {
                // "ん"の時に、右にちょっと飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            }
        }

        if trianglePositionX == 6 && trianglePositionY == 5 {
            if direction == .right {
                // "もどる"から"おわり"に飛ぶ
                diffX += 16
                trianglePositionDiffX += 1
            } else if direction == .up {
                // "もどる"から上は"り"
                diffY += 16
                trianglePositionDiffY -= 1
            }
        }

        if trianglePositionX == 8 && trianglePositionY == 5 {
            if direction == .left {
                // "おわり"から"もどる"に飛ぶ
                diffX -= 16
                trianglePositionDiffX -= 1
            } else if direction == .right {
                // "おわり"から右はいけない
                shouldReturn = true
            } else if direction == .up {
                // "おわり"から上は"れ"
                diffY += 16
                trianglePositionDiffY -= 1
            }
        }
    }
}

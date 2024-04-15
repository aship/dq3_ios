//
//  BaseSceneVirtualPad.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BaseScene {
    func setupVirtualPad(
        leftPad: PadOverlay,
        buttonA: ButtonOverlay,
        buttonB: ButtonOverlay
    ) {
        self.view?.isMultipleTouchEnabled = true

        leftPad.position = CGPoint(
            x: CGFloat(20 - ScreenWidth / 2),
            y: CGFloat(20 - ScreenHeight / 2))
        self.addChild(leftPad)

        let buttonDistance = 100.0
        let center = CGPoint(
            x: 0.0,
            y: 0.0)

        let diffX: CGFloat = 240.0
        let diffY: CGFloat = -180.0

        let buttonAx =
            center.x - CGFloat(buttonDistance) * CGFloat(cosf(Float.pi / 2.0))
            - (buttonA.size.width / 2)
        let buttonAy =
            center.y + CGFloat(buttonDistance) * CGFloat(sinf(Float.pi / 2.0))
            - (buttonA.size.height / 2)

        buttonA.position = CGPoint(
            x: buttonAx + diffX,
            y: buttonAy + diffY)
        self.addChild(buttonA)

        let buttonBx =
            center.x - CGFloat(buttonDistance) * CGFloat(cosf(Float.pi / 4.0))
            - (buttonA.size.width / 2)
        let buttonBy =
            center.y + CGFloat(buttonDistance) * CGFloat(sinf(Float.pi / 4.0))
            - (buttonA.size.height / 2)

        buttonB.position = CGPoint(
            x: buttonBx + diffX,
            y: buttonBy + diffY)
        self.addChild(buttonB)
    }

    func getDirection(
        stickPositionX: CGFloat,
        stickPositionY: CGFloat
    ) -> Direction {
        var direction: Direction = .neutral

        if 0.8 < stickPositionX {
            direction = .right
        } else if stickPositionX < -0.8 {
            direction = .left
        } else if 0.8 < stickPositionY {
            direction = .up
        } else if stickPositionY < -0.8 {
            direction = .down
        }

        return direction
    }
}

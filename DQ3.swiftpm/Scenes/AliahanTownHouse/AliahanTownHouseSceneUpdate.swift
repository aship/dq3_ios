//
//  AliahanTownHouseSceneUpdate.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import SpriteKit

extension AliahanTownHouseScene {
    override func update(_ currentTime: TimeInterval) {
        if self.padDirection == .neutral {
            return
        }

        if self.isMoving {
            return
        }

        if !self.isMovePermitted {
            return
        }

        if self.direction != self.padDirection {
            let action = getCharacterAnimationAction(
                direction: self.padDirection,
                dqCharacter: .hero)
            self.heroNode.run(action)

            self.direction = self.padDirection
        }

        let diffs = getDiffXY(direction: self.padDirection)

        let diffX = diffs.0
        let diffY = diffs.1

        let newPositionX = self.heroPositionX + diffX
        let newPositionY = self.heroPositionY + diffY

        // 衝突チェック
        let canMove = checkCanMove(
            tileMapNode: self.mainTileMapNode,
            newPositionX: newPositionX,
            newPositionY: newPositionY)
        if !canMove {
            return
        }

        // 衝突してない場合、移動
        self.isMoving = true

        moveHero(
            direction: self.padDirection,
            tileMapNode: self.mainTileMapNode,
            heroNode: self.heroNode,
            scale: self.scale,
            newPositionX: newPositionX,
            newPositionY: newPositionY)

        self.heroPositionX = newPositionX
        self.heroPositionY = newPositionY
    }
}

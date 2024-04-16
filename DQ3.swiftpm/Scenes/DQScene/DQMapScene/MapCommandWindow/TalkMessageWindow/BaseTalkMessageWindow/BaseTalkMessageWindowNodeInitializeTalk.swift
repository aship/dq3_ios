//
//  BaseTalkMessageWindowNodeChackCanTalk.swift
//  DQ3
//
//  Created by aship on 2021/04/22.
//

import SpriteKit

extension BaseTalkMessageWindowNode {
    func initializeTalk() {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!

        // 1歩先にNPC がいるか判定
        // いるなら、そのNPC の会話を始める
        self.name = checkWhoToTalkTo(
            positionX: headNode.positionX,
            positionY: headNode.positionY,
            direction: headNode.direction)

        if self.name == nil {
            showDefaultTalkMessage()

            return
        }

        // head の方を向きたい
        for characterNpcNode in self.characterNpcNodes {
            if characterNpcNode.name == self.name {
                if characterNpcNode.dqCharacter == .none {
                    continue
                }

                let direction = headNode.direction
                let reverseDirection = getReverseDirection(direction: direction)

                // isPaused してる状態なので setTexture を行う
                characterNpcNode.setTexture(direction: reverseDirection)
                characterNpcNode.changeDirection(direction: reverseDirection)
            }
        }
    }

    private func checkWhoToTalkTo(
        positionX: Int,
        positionY: Int,
        direction: Direction
    ) -> String? {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!

        let diffs = getDiffXY(direction: headNode.direction)

        let diffX = diffs.0
        let diffY = diffs.1

        let newPositionX = headNode.positionX + diffX
        let newPositionY = headNode.positionY + diffY

        for characterNode in self.characterNpcNodes {
            if characterNode.positionX == newPositionX && characterNode.positionY == newPositionY {
                return characterNode.name!
            }
        }

        return nil
    }
}

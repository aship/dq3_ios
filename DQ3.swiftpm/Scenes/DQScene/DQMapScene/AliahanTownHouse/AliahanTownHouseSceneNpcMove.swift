//
//  AliahanTownHouseSceneNpcMove.swift
//  DQ3
//
//  Created by aship on 2021/01/13.
//

import SpriteKit

extension AliahanTownHouseScene {
    func setNpcMove(
        characterNodes: [CharacterNode],
        characterNpcNodes: [CharacterNode],
        tileMapNode: SKTileMapNode,
        scale: CGFloat,
        dqStory: DQStory
    ) {
        if DebugStopNpc {
            return
        }

        for node in characterNpcNodes {
            if dqStory == .opening && node.name == "mother" {
                continue
            }

            let actionWait = SKAction.wait(forDuration: 2)

            let actionMove = SKAction.run({
                if !node.isMovePermitted {
                    return
                }

                let direction = getRandomDirection()

                node.changeDirection(direction: direction)

                let diffs = getDiffXY(direction: direction)

                let diffX = diffs.0
                let diffY = diffs.1

                let newPositionX = node.positionX + diffX
                let newPositionY = node.positionY + diffY

                // 障害物衝突チェック
                let canMove = self.checkCanMove(
                    tileMapNode: tileMapNode,
                    newPositionX: newPositionX,
                    newPositionY: newPositionY)
                if !canMove {
                    return
                }

                // NPC 衝突チェック
                for characterNpcNode in characterNpcNodes {
                    if characterNpcNode.positionX == newPositionX
                        && characterNpcNode.positionY == newPositionY
                    {
                        return
                    }
                }

                // パーティーメンバーとの衝突チェック
                for characterNode in characterNodes {
                    if characterNode.positionX == newPositionX
                        && characterNode.positionY == newPositionY
                    {
                        return
                    }
                }

                node.moveCharacter(
                    direction: direction,
                    tileMapNode: tileMapNode,
                    scale: scale,
                    completion: {})
            })

            let sequence = SKAction.sequence([
                actionWait,
                actionMove,
            ])
            let actionRepeat = SKAction.repeatForever(sequence)

            node.run(actionRepeat)
        }
    }
}

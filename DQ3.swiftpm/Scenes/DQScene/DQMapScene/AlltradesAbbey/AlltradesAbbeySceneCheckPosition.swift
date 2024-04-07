//
//  AlltradesAbbeySceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/05/17.
//

import SpriteKit

extension AlltradesAbbeyScene {
    func checkPosition(
        newPositionX: Int,
        newPositionY: Int
    ) {
        var enterField = false

        if newPositionX < 0 || newPositionY < 0 {
            enterField = true
        }

        if enterField {
            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()

            DataManager.queueFollowDirections = []

            for node in DataManager.adventureLog.partyCharacterNodes {
                node.positionX = FieldAlltradesAbbeyPositionX
                node.positionY = FieldAlltradesAbbeyPositionY
                node.direction = .down
            }

            self.scene.transitionToMapWithStairs(
                dqSceneTypeFrom: .alltrades_abbey,
                dqSceneTypeTo: .field,
                dqAudio: .field)
        }
    }
}

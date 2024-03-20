//
//  AliahanTownSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownScene {
    func addNpcCharacters(
        tileMapNode: SKTileMapNode,
        scale: CGFloat
    ) {
        addMother(
            tileMapNode: tileMapNode,
            scale: scale)
    }

    private func addMother(
        tileMapNode: SKTileMapNode,
        scale: CGFloat
    ) {
        if DQStory.mother_waiting.rawValue < dqStory.rawValue {
            return
        }

        addCharacter(
            node: self.motherNode,
            tileMapNode: tileMapNode,
            isTown: true)

        var positionX: Int!
        var positionY: Int!

        if dqStory == .opening {
            positionX = AliahanTownMotherStartPositionX
            positionY = AliahanTownMotherStartPositionY

            let actionMother = getCharacterAnimationAction(
                direction: .left,
                dqCharacter: .lady)
            self.motherNode.run(actionMother)
        } else if dqStory == .mother_waiting {
            positionX = AliahanTownMotherWaitingPositionX
            positionY = AliahanTownMotherWaitingPositionY

            let actionMother = getCharacterAnimationAction(
                direction: .up,
                dqCharacter: .lady)
            self.motherNode.run(actionMother)
        }

        setCharacterNpcPosition(
            positionX: positionX,
            positionY: positionY,
            node: self.motherNode,
            tileMapNode: tileMapNode,
            scale: scale)
    }
}

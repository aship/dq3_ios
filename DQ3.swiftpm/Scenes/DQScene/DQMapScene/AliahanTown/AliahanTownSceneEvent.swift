//
//  AliahanTownSceneEvent.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

extension AliahanTownScene {
    func motherAndHeroMove(completion: @escaping () -> Void) {
        let actionMotherAnimationUp = getCharacterAnimationAction(
            direction: .up,
            dqCharacter: .lady)
        let actionMotherAnimationLeft = getCharacterAnimationAction(
            direction: .left,
            dqCharacter: .lady)
        let actionMotherAnimationRight = getCharacterAnimationAction(
            direction: .right,
            dqCharacter: .lady)

        let actionHeroAnimationUp = getCharacterAnimationAction(
            direction: .up,
            dqCharacter: .hero)
        let actionHeroAnimationRight = getCharacterAnimationAction(
            direction: .right,
            dqCharacter: .hero)
        let actionWait1 = SKAction.wait(forDuration: 1 / 4)
        let actionWait6 = SKAction.wait(forDuration: 6 / 4)
        let actionWait8 = SKAction.wait(forDuration: 8 / 4)

        let actionMother1 = SKAction.moveBy(
            x: -16,
            y: 0,
            duration: 1 / 4)

        let actionMother2 = SKAction.moveBy(
            x: 0,
            y: 16 * 6,
            duration: 1 / 4 * 6)

        let actionMother3 = SKAction.moveBy(
            x: 16 * 2,
            y: 0,
            duration: 1 / 4 * 2)

        let actionMother4 = SKAction.moveBy(
            x: 0,
            y: 16 * 3,
            duration: 1 / 4 * 3)

        let actionMother5 = SKAction.moveBy(
            x: 16 * 10,
            y: 0,
            duration: 1 / 4 * 10)

        let actionMother6 = SKAction.moveBy(
            x: 0,
            y: 16 * 7,
            duration: 1 / 4 * 7)

        let motherNode = self.characterNpcNodes.first!

        Task {
            await motherNode.run(actionWait6)

            await motherNode.run(actionMotherAnimationRight, withKey: "")
            await motherNode.run(actionWait1)

            await motherNode.run(actionMotherAnimationLeft, withKey: "")
            await motherNode.run(actionWait1)
            await motherNode.run(actionMother1)

            await motherNode.run(actionMotherAnimationUp, withKey: "")
            await motherNode.run(actionMother2)

            await motherNode.run(actionMotherAnimationRight, withKey: "")
            await motherNode.run(actionMother3)

            await motherNode.run(actionMotherAnimationUp, withKey: "")
            await motherNode.run(actionMother4)

            await motherNode.run(actionMotherAnimationRight, withKey: "")
            await motherNode.run(actionMother5)

            await motherNode.run(actionMotherAnimationUp, withKey: "")
            await motherNode.run(actionMother6)

            await motherNode.run(actionMotherAnimationLeft, withKey: "")
        }

        let actionHero1 = SKAction.moveBy(
            x: -16 * 2,
            y: 0,
            duration: 1 / 4 * 2)

        let actionHero2 = SKAction.moveBy(
            x: 0,
            y: 16 * 2,
            duration: 1 / 4 * 2)

        let actionShowMainTileMap = SKAction.run {
            self.showMainTileMap(
                color: self.greenBGColor,
                insideTileMapNode: self.insideTileMapNode)
        }

        let actionHero3 = SKAction.moveBy(
            x: 0,
            y: 16 * 4,
            duration: 1 / 4 * 4)

        let actionHero4 = SKAction.moveBy(
            x: 16 * 2,
            y: 0,
            duration: 1 / 4 * 2)

        let actionHero5 = SKAction.moveBy(
            x: 0,
            y: 16 * 3,
            duration: 1 / 4 * 3)

        let actionHero6 = SKAction.moveBy(
            x: 16 * 9,
            y: 0,
            duration: 1 / 4 * 9)

        let actionHero7 = SKAction.moveBy(
            x: 0,
            y: 16 * 7,
            duration: 1 / 4 * 7)

        let sequence = SKAction.sequence([
            actionHero2,
            actionShowMainTileMap,
            actionHero3,
        ])

        let heroNode = DataManager.adventureLog.partyCharacterNodes.first!

        Task {
            await heroNode.run(actionWait8)
            await heroNode.run(actionHero1)

            await heroNode.run(actionHeroAnimationUp, withKey: "")
            await heroNode.run(sequence)

            await heroNode.run(actionHeroAnimationRight, withKey: "")
            await heroNode.run(actionHero4)

            await heroNode.run(actionHeroAnimationUp, withKey: "")
            await heroNode.run(actionHero5)

            await heroNode.run(actionHeroAnimationRight, withKey: "")
            await heroNode.run(actionHero6)

            await heroNode.run(actionHeroAnimationUp, withKey: "")
            await heroNode.run(actionHero7)

            completion()
        }

        let actionMap1 = SKAction.moveBy(
            x: 16 * 2 * self.scene.scale,
            y: 0,
            duration: 1 / 4 * 2)

        let actionMap2 = SKAction.moveBy(
            x: 0,
            y: -16 * 6 * self.scene.scale,
            duration: 1 / 4 * 6)

        let actionMap3 = SKAction.moveBy(
            x: -16 * 2 * self.scene.scale,
            y: 0,
            duration: 1 / 4 * 2)

        let actionMap4 = SKAction.moveBy(
            x: 0,
            y: -16 * 3 * self.scene.scale,
            duration: 1 / 4 * 3)

        let actionMap5 = SKAction.moveBy(
            x: -16 * 9 * self.scene.scale,
            y: 0,
            duration: 1 / 4 * 9)

        let actionMap6 = SKAction.moveBy(
            x: 0,
            y: -16 * 7 * self.scene.scale,
            duration: 1 / 4 * 7)

        let actionsMap = SKAction.sequence([
            actionWait8,
            actionMap1,
            actionMap2,
            actionMap3,
            actionMap4,
            actionMap5,
            actionMap6,
        ])
        self.mainTileMapNode.run(actionsMap)
    }
}

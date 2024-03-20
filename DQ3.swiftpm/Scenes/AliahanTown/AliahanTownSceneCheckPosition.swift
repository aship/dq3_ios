//
//  AliahanTownSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownScene {
    override func checkPosition(
        newPositionX: Int,
        newPositionY: Int
    ) {
        var enterInside = false
        var exitInside = false

        var enterHouse = false

        // ルイーダの店がある場所の屋根の下に入る
        if (newPositionX == AliahanTownEnterInsidePubPositionX1
            || newPositionX == AliahanTownEnterInsidePubPositionX2)
            && newPositionY == AliahanTownEnterInsidePubPositionY
        {
            enterInside = true
        }

        // ルイーダの店がある場所の屋根の下から出る
        if (newPositionX == AliahanTownExitInsidePubPositionX1
            || newPositionX == AliahanTownExitInsidePubPositionX2)
            && newPositionY == AliahanTownExitInsidePubPositionY
        {
            exitInside = true
        }

        // 勇者の家の屋根の下に入る
        if newPositionX == AliahanTownEnterInsideHousePositionX
            && newPositionY == AliahanTownEnterInsideHousePositionY
        {
            enterInside = true
        }

        // 勇者の家の屋根の下から出る
        if newPositionX == AliahanTownExitInsideHousePositionX
            && newPositionY == AliahanTownExitInsideHousePositionY
        {
            exitInside = true
        }

        // 教会の屋根の下に入る
        if newPositionX == AliahanTownEnterInsideChurchPositionX
            && newPositionY == AliahanTownEnterInsideChurchPositionY
        {
            enterInside = true
        }

        // 教会の屋根の下から出る
        if newPositionX == AliahanTownExitInsideChurchPositionX
            && newPositionY == AliahanTownExitInsideChurchPositionY
        {
            exitInside = true
        }

        if newPositionX == AliahanTownStairsToHousePositionX
            && newPositionY == AliahanTownStairsToHousePositionY
        {
            enterHouse = true
        }

        if enterInside {
            showInsideTileMap()
        } else if exitInside {
            showMainTileMap(color: self.greenBGColor)
        } else if enterHouse {
            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                SoundEffectManager.play(.stairs)

                headNode.positionX = AliahanTownHouseStairsPositionX
                headNode.positionY = AliahanTownHouseStairsPositionY

                for node in DataManager.adventureLog.partyCharacterNodes {
                    node.removeFromParent()
                }

                let scene = AliahanTownHouseScene()
                let transition = SKTransition.crossFade(withDuration: 1.0)

                self.view?.presentScene(
                    scene,
                    transition: transition)
            }
        }
    }
}

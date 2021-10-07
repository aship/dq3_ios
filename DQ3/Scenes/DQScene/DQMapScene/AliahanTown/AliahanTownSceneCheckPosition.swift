//
//  AliahanTownSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownScene {
    func checkPosition(newPositionX: Int,
                       newPositionY: Int) {
        var enterHouse = false
        
        var enterInside = false
        var exitInside = false
        
        if newPositionX == AliahanTownStairsToHousePositionX &&
            newPositionY == AliahanTownStairsToHousePositionY {
            enterHouse = true
        }
        // ルイーダの店がある場所の屋根の下に入る
        if (newPositionX == AliahanTownEnterInsidePubPositionX1 ||
            newPositionX == AliahanTownEnterInsidePubPositionX2) &&
            newPositionY == AliahanTownEnterInsidePubPositionY {
            enterInside = true
        }
        
        // ルイーダの店がある場所の屋根の下から出る
        if (newPositionX == AliahanTownExitInsidePubPositionX1 ||
            newPositionX == AliahanTownExitInsidePubPositionX2) &&
            newPositionY == AliahanTownExitInsidePubPositionY {
            exitInside = true
        }
        
        // 勇者の家の屋根の下に入る
        if newPositionX == AliahanTownEnterInsideHousePositionX &&
            newPositionY == AliahanTownEnterInsideHousePositionY {
            enterInside = true
        }
        
        // 勇者の家の屋根の下から出る
        if newPositionX == AliahanTownExitInsideHousePositionX &&
            newPositionY == AliahanTownExitInsideHousePositionY {
            exitInside = true
        }
        
        // 教会の屋根の下に入る
        if newPositionX == AliahanTownEnterInsideChurchPositionX &&
            newPositionY == AliahanTownEnterInsideChurchPositionY {
            enterInside = true
        }
        
        // 教会の屋根の下から出る
        if newPositionX == AliahanTownExitInsideChurchPositionX &&
            newPositionY == AliahanTownExitInsideChurchPositionY {
            exitInside = true
        }
        
        if enterHouse {
            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()
            
            DataManager.queueFollowDirections = []
            
            self.scene.transitionToMapWithStairs(
                dqSceneTypeFrom: .aliahan_town,
                dqSceneTypeTo: .aliahan_town_house,
                dqAudio: .town)
        }
        else if enterInside {
            self.showInsideTileMap(insideTileMapNode: self.insideTileMapNode)
        }
        else if exitInside {
            self.showMainTileMap(color: self.greenBGColor,
                                 insideTileMapNode: self.insideTileMapNode)
        }
    }
}

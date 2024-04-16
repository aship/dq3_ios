//
//  BattleGoldWIndowNode.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

class BattleGoldWindowNode: SKTileMapNode {
    var isProcessing = true

    func addToWindow(windowNode: SKTileMapNode) {
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        let adventureLog = DataManager.adventureLog
        let partyCharacterStatuses = adventureLog.partyCharacterStatuses
        let partyCount = partyCharacterStatuses.count

        let numberOfColumns = 16
        let numberOfRows = 4 + (2 * partyCount)

        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8

        setWindow(
            tileMapNode: self,
            numberOfColumns: numberOfColumns,
            numberOfRows: numberOfRows,
            tileSet: tileSet)

        let goldString = String(format: "%7d", adventureLog.gold)

        showWord(
            windowNode: self,
            word: "   G:\(goldString)",
            pointX: 16,
            pointY: -24)

        for (index, partyCharacterStatus) in partyCharacterStatuses.enumerated() {
            let expString = String(format: "%7d", partyCharacterStatus.exp)

            showWord(
                windowNode: self,
                word: "\(partyCharacterStatus.name):\(expString)",
                pointX: 16,
                pointY: -24 - 16 * (index + 1))
        }

        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)

        let pointX = BattleMessageWindowChildOfScenePointX + 128 - 8
        let pointY = BattleMessageWindowChildOfScenePointY + 64 + 32

        self.position = CGPoint(
            x: CGFloat(pointX),
            y: CGFloat(pointY))

        windowNode.addChild(self)
    }
}

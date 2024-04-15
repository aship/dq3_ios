//
//  AdventureLogYesNoDeleteLogWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/15.
//

import SpriteKit

class AdventureLogYesNoDeleteLogWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0

    var adventureLogNumber: Int!

    var dqYesNo: DQYesNo = .yes

    let dqYesNos: [DQYesNo] = [
        .yes,
        .no,
    ]

    init(adventureLogNumber: Int) {
        super.init()

        self.adventureLogNumber = adventureLogNumber
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addToWindow(windowNode: SKTileMapNode) {
        let pointX = 80
        let pointY = 48

        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        let numberOfColumns = 6
        let numberOfRows = 6

        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8

        setWindow(
            tileMapNode: self,
            numberOfColumns: numberOfColumns,
            numberOfRows: numberOfRows,
            tileSet: tileSet)

        addTriangle(
            pointX: 8,
            pointY: -24,
            triangleNode: &self.triangleNode,
            windowNode: self)

        showWord(
            windowNode: self,
            word: "はい",
            pointX: 16,
            pointY: -24)

        showWord(
            windowNode: self,
            word: "いいえ",
            pointX: 16,
            pointY: -24 - 16)

        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(
            x: CGFloat(pointX),
            y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

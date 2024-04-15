//
//  AdventureLogSelectGenderWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/17.
//

import SpriteKit

class AdventureLogSelectGenderWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0

    var adventureLogNumber: Int!
    var dqAdventureLogTop: DQAdventureLogTop?
    var adventureLogMessageSpeedWindowNode: AdventureLogMessageSpeedWindowNode?

    var dqGender: DQGender = .male

    let dqGenders: [DQGender] = [
        .male,
        .female,
    ]

    init(
        dqAdventureLogTop: DQAdventureLogTop,
        adventureLogNumber: Int
    ) {
        super.init()

        self.dqAdventureLogTop = dqAdventureLogTop
        self.adventureLogNumber = adventureLogNumber
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addToWindow(windowNode: SKTileMapNode) {
        let pointX = 128
        let pointY = -32

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
            word: "おとこ",
            pointX: 16,
            pointY: -24)

        showWord(
            windowNode: self,
            word: "おんな",
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

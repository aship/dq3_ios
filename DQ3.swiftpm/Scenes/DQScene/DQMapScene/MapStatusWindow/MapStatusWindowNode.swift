//
//  MapStatusWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/10.
//

import SpriteKit

class MapStatusWindowNode: SKTileMapNode {
    var isOpen = false

    func close() {
        self.removeFromParent()
        self.isOpen = false
    }

    func addToScene(
        partyCharacterNodes: [CharacterNode],
        scene: SKScene,
        scale: CGFloat
    ) {
        self.isOpen = true

        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        var numberOfColumns = 22
        let numberOfRows = 8

        var actuallPointX = -80
        let pointY = -40

        let numberOfPersons = partyCharacterNodes.count

        if numberOfPersons == 3 {
            numberOfColumns -= 4
            actuallPointX += 32
        } else if numberOfPersons == 2 {
            numberOfColumns -= 5 * 2
            actuallPointX += 40 * 2
        } else if numberOfPersons == 1 {
            numberOfColumns -= 14
            actuallPointX += 112
        }

        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8

        setWindow(
            tileMapNode: self,
            numberOfColumns: numberOfColumns,
            numberOfRows: numberOfRows,
            tileSet: tileSet)

        self.setScale(scale)
        self.zPosition = ZPositionStatusWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(
            x: CGFloat(actuallPointX) * scale,
            y: CGFloat(pointY) * scale)
        scene.addChild(self)

        for (index, status) in DataManager.adventureLog.partyCharacterStatuses.enumerated() {
            showPersonalStatus(
                index: index,
                numberOfPersons: numberOfPersons,
                name: status.name,
                hp: status.hp,
                mp: status.mp,
                dqVocation: status.dqVocation,
                level: status.level)
        }
    }

    private func showPersonalStatus(
        index: Int,
        numberOfPersons: Int,
        name: String,
        hp: Int,
        mp: Int,
        dqVocation: DQVocation,
        level: Int
    ) {
        let diffX = 40
        let diffY = 16

        var baseX = 8 + index * diffX
        let baseY = -8

        if numberOfPersons == 3 || numberOfPersons == 1 {
            baseX += 8
        }

        var vocationLetter = ""

        switch dqVocation {
        case .hero: vocationLetter = "ゆ"
        case .warrior: vocationLetter = "せ"
        case .priest: vocationLetter = "そ"
        case .mage: vocationLetter = "ま"
        case .martial_artist: vocationLetter = "ぶ"
        case .merchant: vocationLetter = "し"
        case .gadabout: vocationLetter = "あ"
        case .sage: vocationLetter = "け"
        }

        let hpString = String(format: "%3d", hp)
        let mpString = String(format: "%3d", mp)
        let levelString = String(format: "%2d", level)

        showWord(
            windowNode: self,
            word: name,
            pointX: baseX,
            pointY: baseY)

        showWord(
            windowNode: self,
            word: "H\(hpString)",
            pointX: baseX,
            pointY: baseY - diffY)

        showWord(
            windowNode: self,
            word: "M\(mpString)",
            pointX: baseX,
            pointY: baseY - diffY * 2)

        showWord(
            windowNode: self,
            word: "\(vocationLetter):\(levelString)",
            pointX: baseX,
            pointY: baseY - diffY * 3)
    }
}

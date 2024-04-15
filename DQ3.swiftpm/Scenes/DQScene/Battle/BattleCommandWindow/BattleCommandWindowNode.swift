//
//  BattleCommandWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/18.
//

import SpriteKit

class BattleCommandWindowNode: SKTileMapNode {
    private(set) var battleScene: BattleScene!

    var battleSpellWindowNode = BattleSpellWindowNode(battleScene: nil)

    private(set) var isOpen = false
    var arrLines: [[SKSpriteNode]] = []
    var nextMark: SKSpriteNode!

    var triangleNode = SKSpriteNode()
    var triangleMoving = false

    var dqBattleCommand: DQBattleCommand = .fight
    var dqBattleCommands: [DQBattleCommand] = []

    init(battleScene: BattleScene?) {
        super.init()

        self.battleScene = battleScene
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func close() {
        self.isOpen = false
        self.removeFromParent()
    }

    func addToScene(
        scene: SKScene,
        scale: CGFloat
    ) {
        self.isOpen = true

        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        let numberOfColumns = 24 - 16
        let numberOfRows = 10

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

        let pointX = BattleMessageWindowChildOfScenePointX
        let pointY = BattleMessageWindowChildOfScenePointY

        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(
            x: CGFloat(pointX) * scale,
            y: CGFloat(pointY) * scale)
        scene.addChild(self)
    }

    func setName(name: String) {
        showWord(
            windowNode: self,
            word: name,
            pointX: 16,
            pointY: -8)
    }

    func setCommand(
        dqVocation: DQVocation,
        index: Int
    ) {
        // 職業、何番目かによってコマンドがかわる
        // あー、しかし将来的には転職すれば、戦士でも呪文使えたりするか。。
        // 1番目は、「にげる」が選択できる
        if index == 0 {
            if dqVocation == .hero || dqVocation == .priest || dqVocation == .mage
                || dqVocation == .sage
            {
                self.dqBattleCommands = [
                    .fight,
                    .spells,
                    .flee,
                    .items,
                ]
            } else {
                self.dqBattleCommands = [
                    .fight,
                    .flee,
                    .defend,
                    .items,
                ]
            }
        } else {
            if dqVocation == .hero || dqVocation == .priest || dqVocation == .mage
                || dqVocation == .sage
            {
                self.dqBattleCommands = [
                    .fight,
                    .spells,
                    .defend,
                    .items,
                ]
            } else {
                self.dqBattleCommands = [
                    .fight,
                    .defend,
                    .items,
                ]
            }
        }

        let words = self.dqBattleCommands.map { getDQBattleCommandNameFrom(dqBattleCommand: $0) }

        showWords(
            windowNode: self,
            words: words,
            pointX: 16,
            pointY: -24)
    }
}

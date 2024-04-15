//
//  BattleSpellWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/29.
//

import SpriteKit

class BattleSpellWindowNode: SKTileMapNode {
    private(set) var battleScene: BattleScene!
    private(set) var isOpen = false

    var arrLines: [[SKSpriteNode]] = []
    var nextMark: SKSpriteNode!

    var triangleNode = SKSpriteNode()
    var triangleMoving = false

    var dqSpell: DQSpell = .kaboom

    let dqSpells: [DQSpell] = [
        .kaboom,
        .kacrackle,
        .fullheal,
    ]

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

    func addToWindow(windowNode: SKTileMapNode) {
        self.isOpen = true

        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        let numberOfColumns = 16
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

        let words = self.dqSpells.map { getSpellNameFrom(dqSpell: $0) }

        showWords(
            windowNode: self,
            words: words,
            pointX: 16,
            pointY: -24)

        let pointX = BattleSpellWindowChildOfCommandWindowPointX
        let pointY = BattleSpellWindowChildOfCommandWindowPointY

        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(
            x: CGFloat(pointX),
            y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

//
//  BattleTargetWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/18.
//

import SpriteKit

class BattleTargetWindowNode: SKTileMapNode {
    private(set) var battleScene: BattleScene!
    //  private(set) var monsterGroups: [MonsterGroup] = []

    private(set) var selectableMonsterGroups: [MonsterGroup] = []
    var selectedMonsterGroup: MonsterGroup!

    private(set) var isOpen = false
    private(set) var isFocused = false

    var arrLines: [[SKSpriteNode]] = []
    var nextMark: SKSpriteNode!

    var triangleNode = SKSpriteNode()
    var triangleMoving = false

    //    var dqMonsterTypeTarget: DQMonsterType!
    //    var dqMonsterTypeTargets: [DQMonsterType] = []

    init(
        battleScene: BattleScene?,
        monsterGroups: [MonsterGroup]
    ) {
        super.init()

        self.battleScene = battleScene
        //     self.monsterGroups = monsterGroups

        for monsterGroup in monsterGroups {
            let isSomeMonstersAlive = monsterGroup.checkSomeMonstersAlive()

            if !isSomeMonstersAlive {
                // グループのモンスター全員倒されている場合はスキップ
                continue
            }

            if self.selectedMonsterGroup == nil {
                self.selectedMonsterGroup = monsterGroup
            }

            self.selectableMonsterGroups.append(monsterGroup)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func close() {
        self.isOpen = false
        self.removeFromParent()
    }

    func setFocused() {
        self.isFocused = true

        showWord(
            windowNode: self,
            word: "　→",
            pointX: 8,
            pointY: -8)

        addTriangle(
            pointX: 8,
            pointY: -24,
            triangleNode: &self.triangleNode,
            windowNode: self)
    }

    func addToScene(
        scene: SKScene,
        scale: CGFloat
    ) {
        self.isOpen = true

        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        let numberOfColumns = 16
        let numberOfRows = 2 + (self.selectableMonsterGroups.count * 2)

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
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)

        let pointX = BattleTargetWindowChildOfScenePointX
        let pointY = BattleTargetWindowChildOfScenePointY

        self.position = CGPoint(
            x: CGFloat(pointX) * scale,
            y: CGFloat(pointY) * scale)
        scene.addChild(self)
    }

    func setTargets() {
        let monsterNames = self.selectableMonsterGroups.map {
            getDQMonsterTypeNameFrom(dqMonsterType: $0.dqMonsterType)
        }

        var words: [String] = []

        for (index, monsterName) in monsterNames.enumerated() {
            let monsterGroup = self.selectableMonsterGroups[index]
            //
            //
            //
            //            print("monsterGroup.monsterNodes.count \(monsterGroup.monsterNodes.count)")
            //
            let monsterNameWithPadding = monsterName.paddedToWidth(7)
            let aliveMonstersCount = monsterGroup.monsterNodes.filter({ 0 < $0.hp }).count

            let word = String(format: "%@ - %dひき", monsterNameWithPadding, aliveMonstersCount)
            words.append(word)
        }

        showWords(
            windowNode: self,
            words: words,
            pointX: 16,
            pointY: -24)
    }
}

extension String {
    public func paddedToWidth(_ width: Int) -> String {
        let length = self.count
        guard length < width else {
            return self
        }

        let spaces = Array<Character>.init(repeating: " ", count: width - length)
        return self + spaces
    }
}

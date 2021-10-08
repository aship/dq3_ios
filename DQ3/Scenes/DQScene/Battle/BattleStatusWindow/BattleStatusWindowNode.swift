//
//  BattleStatusWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/18.
//

import SpriteKit

class BattleStatusWindowNode: SKTileMapNode {
    var isOpen = false
    
    func close() {
        self.removeFromParent()
        self.isOpen = false
    }
    
    func addToScene(scene: SKScene,
                    partyCharacterNodes: [CharacterNode],
                    scale: CGFloat) {
        self.isOpen = true
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        var numberOfColumns = 22
        let numberOfRows = 8
        
        let pointX = -96
        let pointY = 112
        
        let numberOfPersons = partyCharacterNodes.count
        
        if numberOfPersons == 3 {
            numberOfColumns -= 4
        }
        else if numberOfPersons == 2 {
            numberOfColumns -= 10
        }
        else if numberOfPersons == 1 {
            numberOfColumns -= 14
        }
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        self.setScale(scale)
        self.zPosition = ZPositionStatusWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        scene.addChild(self)
        
        for (index, status) in DataManager.adventureLog.partyCharacterStatuses.enumerated() {
            showPersonalStatus(index: index,
                               numberOfPersons: numberOfPersons,
                               name: status.name,
                               hp: status.hp,
                               mp: status.mp,
                               dqVocation: status.dqVocation,
                               level: status.level)
        }
    }
    
    private func showPersonalStatus(index: Int,
                                    numberOfPersons: Int,
                                    name: String,
                                    hp: Int,
                                    mp: Int,
                                    dqVocation: DQVocation,
                                    level: Int) {
        let diffX = 40
        let diffY = 16
        
        var baseX = 8 + index * diffX
        let baseY = -8
        
        if numberOfPersons == 3 ||
            numberOfPersons == 1 {
            baseX += 8
        }
        
        var vocationLetter = ""
        
        switch dqVocation {
        case .hero: vocationLetter = "ゆ"
        case .warrior: vocationLetter = "せ"
        case .priest: vocationLetter = "そ"
        case .mage: vocationLetter = "ま"
        default: vocationLetter = "?"
        }
        
        let hpString = String(format: "%3d", hp)
        let mpString = String(format: "%3d", mp)
        let levelString = String(format: "%2d", level)
        
        showWord(windowNode: self,
                 word: name,
                 pointX: baseX,
                 pointY: baseY)
        
        showWord(windowNode: self,
                 word: "H\(hpString)",
                 pointX: baseX,
                 pointY: baseY - diffY)
        
        showWord(windowNode: self,
                 word: "M\(mpString)",
                 pointX: baseX,
                 pointY: baseY - diffY * 2)
        
        showWord(windowNode: self,
                 word: "\(vocationLetter):\(levelString)",
                 pointX: baseX,
                 pointY: baseY - diffY * 3)
    }
}

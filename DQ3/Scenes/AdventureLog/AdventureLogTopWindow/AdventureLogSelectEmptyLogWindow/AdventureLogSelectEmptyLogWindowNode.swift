//
//  AdventureLogSelectEmptyLogWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/15.
//

import SpriteKit

class AdventureLogSelectEmptyLogWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0
    
    var dqAdventureLogTop: DQAdventureLogTop!
    
    // copy のときのみ copy元の冒険の書の番号として使う
    var adventureLogNumber: Int?
    
    var adventureLogInputNameWindowNode: AdventureLogInputNameWindowNode?
    var adventureLogConfirmDeleteLogWindowNode: AdventureLogConfirmDeleteLogWindowNode?
    var adventureLogYesNoDeleteLogWindowNode: AdventureLogYesNoDeleteLogWindowNode?
    
    init(dqAdventureLogTop: DQAdventureLogTop,
         adventureLogNumber: Int?) {
        super.init()
        
        self.dqAdventureLogTop = dqAdventureLogTop
        self.adventureLogNumber = adventureLogNumber
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToWindow(windowNode: SKTileMapNode) {
        var pointX = 0
        var pointY = 0
        
        if self.dqAdventureLogTop == .create {
            pointX = 64
            pointY = -64
        }
        else if self.dqAdventureLogTop == .copy {
            pointX = 32
            pointY = -32
        }
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
        let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
        let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)
        
        let numberOfAdventureLogs = getNumberOfAdventureLogs(adventureLog1: adventureLog1,
                                                             adventureLog2: adventureLog2,
                                                             adventureLog3: adventureLog3)
        let numberOfColumns = 12
        let numberOfRows = 2 * (4 - numberOfAdventureLogs)
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        addTriangle(pointX: 8,
                    pointY: -24,
                    triangleNode: &self.triangleNode,
                    windowNode: self)
        
        var logCount = 0
        
        if adventureLog1 == nil {
            showWord(windowNode: self,
                     word: "ぼうけんのしょ 1",
                     pointX: 16,
                     pointY: -24)
            
            logCount += 1
        }
        
        if adventureLog2 == nil {
            showWord(windowNode: self,
                     word: "ぼうけんのしょ 2",
                     pointX: 16,
                     pointY: -24 - logCount * 16)
            logCount += 1
        }
        
        if adventureLog3 == nil {
            showWord(windowNode: self,
                     word: "ぼうけんのしょ 3",
                     pointX: 16,
                     pointY: -24 - logCount * 16)
        }
        
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

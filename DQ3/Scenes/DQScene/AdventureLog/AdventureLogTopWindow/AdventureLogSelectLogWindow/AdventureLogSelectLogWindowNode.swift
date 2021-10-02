//
//  AdventureLogSelectLogWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

class AdventureLogSelectLogWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0
    
    var dqAdventureLogTop: DQAdventureLogTop?
    
    var adventureLogMessageSpeedWindowNode: AdventureLogMessageSpeedWindowNode?
    var adventureLogSelectEmptyLogWindowNode: AdventureLogSelectEmptyLogWindowNode?
    var adventureLogConfirmDeleteLogWindowNode: AdventureLogConfirmDeleteLogWindowNode?
    var adventureLogYesNoDeleteLogWindowNode: AdventureLogYesNoDeleteLogWindowNode?
    
    init(dqAdventureLogTop: DQAdventureLogTop) {
        super.init()
        
        self.dqAdventureLogTop = dqAdventureLogTop
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToWindow(windowNode: SKTileMapNode) {
        let pointX = 32
        let pointY = -32
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
        let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
        let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)
        
        let numberOfAdventureLogs = getNumberOfAdventureLogs(adventureLog1: adventureLog1,
                                                             adventureLog2: adventureLog2,
                                                             adventureLog3: adventureLog3)
        let numberOfColumns = 18
        let numberOfRows = 2 + 2 * numberOfAdventureLogs
        
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
        
        if adventureLog1 != nil {
            showWord(windowNode: self,
                     word: "ぼうけんのしょ 1:あしひー",
                     pointX: 16,
                     pointY: -24)
            
            logCount += 1
        }
        
        if adventureLog2 != nil {
            showWord(windowNode: self,
                     word: "ぼうけんのしょ 2:あしひー",
                     pointX: 16,
                     pointY: -24 - logCount * 16)
            logCount += 1
        }
        
        if adventureLog3 != nil {
            showWord(windowNode: self,
                     word: "ぼうけんのしょ 3:あしひー",
                     pointX: 16,
                     pointY: -24 - logCount * 16)
        }
        
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

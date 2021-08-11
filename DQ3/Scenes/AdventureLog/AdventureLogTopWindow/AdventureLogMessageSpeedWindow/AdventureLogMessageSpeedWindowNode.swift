//
//  AdventureLogMessageSpeedWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/16.
//

import SpriteKit

class AdventureLogMessageSpeedWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0
    
    var adventureLogNumber: Int?
    var dqAdventureLogTop: DQAdventureLogTop?
    
    init(dqAdventureLogTop: DQAdventureLogTop,
         adventureLogNumber: Int) {
        super.init()
        
        self.dqAdventureLogTop = dqAdventureLogTop
        self.adventureLogNumber = adventureLogNumber
        
        var adventureLog: AdventureLog!
        
        if dqAdventureLogTop == .create {
            adventureLog = DataManager.adventureLog
        }
        else if dqAdventureLogTop == .change_message_speed {
            adventureLog = UserDefaultsUtil.loadAdventureLog(number: adventureLogNumber)!
        }
        
        self.triangleIndex = adventureLog.messageSpeed - 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToWindow(windowNode: SKTileMapNode) {
        var pointX = 0
        var pointY = 0
        
        if dqAdventureLogTop == .create {
            pointX = -96
            pointY = -32
        }
        else if dqAdventureLogTop == .change_message_speed {
            pointX = -16
            pointY = -32
        }
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 18
        let numberOfRows = 9
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        showWord(windowNode: self,
                 word: "おこのみの ひょうじそくどは?",
                 pointX: 8,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: " 1 2 3 4 5 6 7 8",
                 pointX: 8,
                 pointY: -48)
        
        showWord(windowNode: self,
                 word: "はやい          おそい",
                 pointX: 8,
                 pointY: -64)
        
        addTriangle(pointX: 8 + 16 * self.triangleIndex,
                    pointY: -48,
                    triangleNode: &self.triangleNode,
                    windowNode: self)
        
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

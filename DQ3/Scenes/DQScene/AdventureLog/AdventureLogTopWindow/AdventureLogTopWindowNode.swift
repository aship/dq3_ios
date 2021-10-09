//
//  AdventureLogTopWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/12.
//

import SpriteKit

class AdventureLogTopWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    
    var adventureLogSelectLogWindowNode: AdventureLogSelectLogWindowNode?
    var adventureLogSelectEmptyLogWindowNode: AdventureLogSelectEmptyLogWindowNode?
    
    var dqAdventureLogTop: DQAdventureLogTop!
    var dqAdventureLogTops: [DQAdventureLogTop] = []
    
    func addToScene(scene: SKScene,
                    numberOfAdventureLogs: Int,
                    scale: CGFloat) {
        // x: 48, y: 56 は左上(0, 0)基準
        let pointX = -128 + 48
        let pointY = 112 - 56
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 12 + 2
        var numberOfRows: Int!
        
        if numberOfAdventureLogs == 0 {
            numberOfRows = 4
            
            self.dqAdventureLogTop = .create
            self.dqAdventureLogTops = [.create]
        }
        else if numberOfAdventureLogs == 1 ||
                    numberOfAdventureLogs == 2 {
            numberOfRows = 12
            
            self.dqAdventureLogTop = .go
            self.dqAdventureLogTops = [.go,
                                       .change_message_speed,
                                       .create,
                                       .copy,
                                       .delete]
        }
        else if numberOfAdventureLogs == 3 {
            numberOfRows = 8
            
            self.dqAdventureLogTop = .go
            self.dqAdventureLogTops = [.go,
                                       .change_message_speed,
                                       .delete]
        }
        
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
        
        if numberOfAdventureLogs == 0 {
            showWord(windowNode: self,
                     word: "ぼうけんのしょをつくる",
                     pointX: 16,
                     pointY: -24)
        }
        else if numberOfAdventureLogs == 1 ||
                    numberOfAdventureLogs == 2 {
            showWord(windowNode: self,
                     word: "ぼうけんをする",
                     pointX: 16,
                     pointY: -24)
            
            showWord(windowNode: self,
                     word: "ひょうじそくどをかえる",
                     pointX: 16,
                     pointY: -24 - 16)
            
            showWord(windowNode: self,
                     word: "ぼうけんのしょをつくる",
                     pointX: 16,
                     pointY: -24 - 16 * 2)
            
            showWord(windowNode: self,
                     word: "ぼうけんのしょをうつす",
                     pointX: 16,
                     pointY: -24 - 16 * 3)
            
            showWord(windowNode: self,
                     word: "ぼうけんのしょをけす",
                     pointX: 16,
                     pointY: -24 - 16 * 4)
        }
        else if numberOfAdventureLogs == 3 {
            showWord(windowNode: self,
                     word: "ぼうけんをする",
                     pointX: 16,
                     pointY: -24)
            
            showWord(windowNode: self,
                     word: "ひょうじそくどをかえる",
                     pointX: 16,
                     pointY: -24 - 16)
            
            showWord(windowNode: self,
                     word: "ぼうけんのしょをけす",
                     pointX: 16,
                     pointY: -24 - 16 * 2)
        }
        
        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        scene.addChild(self)
    }
}


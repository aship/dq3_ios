//
//  AdventureLogInputNameWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/16.
//

import SpriteKit

class AdventureLogInputNameWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    
    var trianglePositionX = 0
    var trianglePositionY = 0
    
    var nameTileMapNode: SKTileMapNode?
    var underlineNode: SKSpriteNode?
    
    var adventureLogSelectGenderWindowNode: AdventureLogSelectGenderWindowNode?
    // 今何文字目入力か
    var letterIndex = 0
    
    var heroName0 = ""
    var heroName1 = ""
    var heroName2 = ""
    var heroName3 = ""
    
    var adventureLogNumber: Int!
    
    var dqYesNo: DQYesNo = .yes
    
    let dqYesNos: [DQYesNo] = [.yes,
                               .no]
    
    init(adventureLogNumber: Int) {
        super.init()
        
        self.adventureLogNumber = adventureLogNumber
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToWindow(windowNode: SKTileMapNode) {
        setupSecondWindow(windowNode: windowNode)
        
        let pointX = -80
        let pointY = 64
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 24
        let numberOfRows = 14
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        showWord(windowNode: self,
                 word: "あ い う え お  は ひ ふ へ ほ",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "か き く け こ  ま み む め も",
                 pointX: 16,
                 pointY: -24 - 16)
        
        showWord(windowNode: self,
                 word: "さ し す せ そ  や   ゆ   よ",
                 pointX: 16,
                 pointY: -24 - 16 * 2)
        
        showWord(windowNode: self,
                 word: "た ち つ て と  ら り る れ ろ",
                 pointX: 16,
                 pointY: -24 - 16 * 3)
        
        showWord(windowNode: self,
                 word: "な に ぬ ね の  わ   を   ん",
                 pointX: 16,
                 pointY: -24 - 16 * 4)
        
        showWord(windowNode: self,
                 word: "っ ゃ ゅ ょ 濁  半 もどる おわり",
                 pointX: 16,
                 pointY: -24 - 16 * 5)
        
        addTriangle(pointX: 8,
                    pointY: -24,
                    triangleNode: &self.triangleNode,
                    windowNode: self)
        
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
    
    private func setupSecondWindow(windowNode: SKTileMapNode) {
        let pointX = -32
        let pointY = 96
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 12
        let numberOfRows = 5
        
        self.nameTileMapNode = SKTileMapNode()
        self.nameTileMapNode?.tileSet = tileSet
        self.nameTileMapNode?.numberOfColumns = numberOfColumns
        self.nameTileMapNode?.numberOfRows = numberOfRows
        self.nameTileMapNode?.tileSize = size8
        
        setWindow(tileMapNode: self.nameTileMapNode!,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        showWord(windowNode: self.nameTileMapNode!,
                 word: "なまえ",
                 pointX: 16 + 16,
                 pointY: -24 + 16)
        
        showWord(windowNode: self.nameTileMapNode!,
                 word: "****",
                 pointX: 16 + 16,
                 pointY: -24 - 16 + 16)
        
        addUnderline(pointX: 32,
                     pointY: -32,
                     underlineNode: &self.underlineNode,
                     windowNode: self.nameTileMapNode!)
        
        self.nameTileMapNode?.zPosition = ZPositionWindow
        self.nameTileMapNode?.anchorPoint = CGPoint(x: 0, y: 1)
        self.nameTileMapNode?.position = CGPoint(x: CGFloat(pointX),
                                                 y: CGFloat(pointY))
        windowNode.addChild(self.nameTileMapNode!)
    }
    
    private func addUnderline(pointX: Int,
                              pointY: Int,
                              underlineNode: inout SKSpriteNode?,
                              windowNode: SKTileMapNode) {
        underlineNode = DQFont.getFont(string: "_")
        underlineNode?.position = CGPoint(x: pointX,
                                          y: pointY)
        windowNode.addChild(underlineNode!)
    }
}

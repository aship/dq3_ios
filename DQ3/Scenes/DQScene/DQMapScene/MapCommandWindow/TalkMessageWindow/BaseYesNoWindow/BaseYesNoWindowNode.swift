//
//  BaseYesNoWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

class BaseYesNoWindowNode: SKTileMapNode {
    var isOpen = false
    
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0
    
    var dqYesNo: DQYesNo = .yes
    
    let dqYesNos: [DQYesNo] = [.yes,
                               .no]
    
    init(name: String) {
        super.init()
        
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func close() {
        self.removeFromParent()
        self.isOpen = false
    }
    
    func addToWindow(windowNode: SKTileMapNode) {
        self.isOpen = true
        
        let pointX = 112
        let pointY = 96
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        self.tileSet = tileSet
        self.numberOfColumns = 6
        self.numberOfRows = 6
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        addTriangle(pointX: 8,
                    pointY: -24,
                    triangleNode: &self.triangleNode,
                    windowNode: self)
        
        showWord(windowNode: self,
                 word: "はい",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "いいえ",
                 pointX: 16,
                 pointY: -24 - 16)
        
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

//
//  BattleGoldWIndowNode.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

class BattleGoldWindowNode: SKTileMapNode {
    func addToWindow(windowNode: SKTileMapNode) {
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 16
        let numberOfRows = 10
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        showWord(windowNode: self,
                 word: "   G:    130",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "えにくす:      6",
                 pointX: 16,
                 pointY: -24 - 16)
        
        showWord(windowNode: self,
                 word: "あしひい:    888",
                 pointX: 16,
                 pointY: -24 - 16 * 2)
        
        showWord(windowNode: self,
                 word: "えしひい:9999999",
                 pointX: 16,
                 pointY: -24 - 16 * 3)
        
        
        
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        
        let pointX = BattleMessageWindowChildOfScenePointX + 128 - 8
        let pointY = BattleMessageWindowChildOfScenePointY + 64 + 32
        
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        
        windowNode.addChild(self)
    }
}

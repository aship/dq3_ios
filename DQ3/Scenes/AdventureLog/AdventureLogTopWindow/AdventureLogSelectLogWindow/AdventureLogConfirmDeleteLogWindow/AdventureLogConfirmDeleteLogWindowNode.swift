//
//  AdventureLogConfirmDeleteLogWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/14.
//

import SpriteKit

class AdventureLogConfirmDeleteLogWindowNode: SKTileMapNode {
    func addToWindow(windowNode: SKTileMapNode) {
        let pointX = -16
        let pointY = -16
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 14
        let numberOfRows = 12
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        showWord(windowNode: self,
                 word: "ゆうしゃ あしひー",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "レベル  88",
                 pointX: 16,
                 pointY: -24 - 16)
        
        showWord(windowNode: self,
                 word: "のぼうけんのしょを",
                 pointX: 16,
                 pointY: -24 - 16 * 2)
        
        showWord(windowNode: self,
                 word: "  けします。",
                 pointX: 16,
                 pointY: -24 - 16 * 3)
        
        showWord(windowNode: self,
                 word: " いいですか?",
                 pointX: 16,
                 pointY: -24 - 16 * 4)
        
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

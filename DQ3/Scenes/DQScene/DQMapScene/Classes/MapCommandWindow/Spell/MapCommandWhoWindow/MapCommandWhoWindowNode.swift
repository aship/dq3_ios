//
//  MapCommandWhoWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

class MapCommandWhoWindowNode: SKTileMapNode {
    var isOpen = false
    var triangleNode = SKSpriteNode()
    var traiangleMoving = false
    
    var mapCommandSpellWindowNode = MapCommandSpellWindowNode()
    
//    func close() {
//        self.removeFromParent()
//        self.isOpen = false
//    }
//    
    func addToWindow(windowNode: SKTileMapNode,
                     scale: CGFloat) {
        self.removeFromParent()
        self.isOpen = true
                
        let pointX = 32
        let pointY = -16
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 10
        let numberOfRows = 4
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        showWord(windowNode: self,
                 word: "じゅもん",
                 pointX: 24,
                 pointY: -8)
        
        addTriangle(pointX: 16,
                    pointY: -24,
                    triangleNode: &self.triangleNode,
                    windowNode: self)
        
        showWord(windowNode: self,
                 word: "えにくす",
                 pointX: 24,
                 pointY: -24)
        
        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        windowNode.addChild(self)
    }
}

//
//  MapCommandWhoWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

class MapCommandWhoWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    
    var mapCommandSpellWindowNode: MapCommandSpellWindowNode?
    
    func addToWindow(windowNode: SKTileMapNode) {
        let pointX = 32
        let pointY = -16
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        self.tileSet = tileSet
        self.numberOfColumns = 10
        self.numberOfRows = 4
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
        
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

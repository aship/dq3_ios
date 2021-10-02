//
//  MapCommandSpellWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

class MapCommandSpellWindowNode: SKTileMapNode,
                                 ZoomDelegate {
    var isOpen = false
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    
    var mapMessageWindowNode = MapMessageWindowNode()
    var mapCommandZoomWindowNode = MapCommandZoomWindowNode()
    
    var dqSpell: DQSpell = .heal
    
    let dqSpells: [DQSpell] = [.heal,
                               .zoom,
                               .rvac,
                               .holy_protection,
                               .midheal,
                               .fullheal,
                               .zing,
                               .omniheal]
    func close() {
        self.removeFromParent()
        self.isOpen = false
    }
    
    func addToWindow(windowNode: SKTileMapNode,
                     scale: CGFloat) {
        self.removeFromParent()
        self.isOpen = true
        
        let pointX = 80
        let pointY = 16
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 8
        let numberOfRows = 18
        
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
        
        let words = self.dqSpells.map { getSpellNameFrom(dqSpell: $0) }
        
        showWords(windowNode: self,
                  words: words,
                  pointX: 16,
                  pointY: -24)
        
        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        windowNode.addChild(self)
    }
}

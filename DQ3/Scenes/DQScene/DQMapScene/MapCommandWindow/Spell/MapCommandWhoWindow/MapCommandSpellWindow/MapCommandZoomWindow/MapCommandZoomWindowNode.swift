//
//  MapCommandZoomWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

protocol ZoomDelegate: NSObjectProtocol {
    func doSomething(page: Int)
}

class MapCommandZoomWindowNode: SKTileMapNode {
    weak var delegate: ZoomDelegate?
    
    var isOpen = false
    
    var mapMessageWindowNode: MapMessageWindowNode?
    
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    
    var page = 0
    
    var isProcessing = false
    
    var dqZoom: DQZoom = .aliahan
    var dqZooms: [DQZoom] = []
    
    func close() {
        self.removeFromParent()
        self.isOpen = false
    }
    
    func addToWindow(page: Int,
                     initialPage: Bool,
                     windowNode: SKTileMapNode,
                     scale: CGFloat) {
        self.removeFromParent()
        self.isOpen = true
        self.page = page
        
        let pointX = -96
        let pointY = -112
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 10
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
                 word: "　→",
                 pointX: 8,
                 pointY: -8)
        
        showWord(windowNode: self,
                 word: "怒こへ",
                 pointX: 40,
                 pointY: -8)
        
        var triangleY = -24
        
        if initialPage {
            self.dqZoom = .aliahan
        }
        else {
            self.dqZoom = .next_page
            triangleY += 16
        }
        
        addTriangle(pointX: 8,
                    pointY: triangleY,
                    triangleNode: &self.triangleNode,
                    windowNode: self)
        
        if page == 0 {
            self.dqZooms = [.aliahan,
                            .reeve,
                            .romaria,
                            .khoryv,
                            .norvik]
        }
        else if page == 1 {
            self.dqZooms = [.asham,
                            .isis,
                            .portoga,
                            .baharata,
                            .alltrades_abbey]
        }
        else if page == 2 {
            self.dqZooms = [.lanson,
                            .jipang,
                            .edina,
                            .manoza,
                            .persistence]
        }
        else if page == 3 {
            self.dqZooms = [.tantegel,
                            .damdara,
                            .cantlin,
                            .kol,
                            .rimuldar]
        }
        
        let words = self.dqZooms.map { getZoomNameFrom(dqZoom: $0) }
        
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

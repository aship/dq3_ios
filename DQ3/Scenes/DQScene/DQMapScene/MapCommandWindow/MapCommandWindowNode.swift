//
//  MapCommandWindowNode.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class MapCommandWindowNode: SKTileMapNode {
    enum CommandType {
        case talk // はなす
        case spells // じゅもん
        case status // つよさ
        case items // どうぐ
        case equip // そうび
        case search // しらべる
    }
    
    enum CommandWindowStatus {
        case open
        case processing
        case should_close
    }
    
    var isOpen = false
    var commandType: CommandType = .talk
    var commandWindowStatus: CommandWindowStatus = .open
    
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    
    var mapMessageWindowNode: MapMessageWindowNode?
    
    func close() {
        self.isOpen = false
        self.removeFromParent()
    }
    
    func addToScene(scene: SKScene,
                    scale: CGFloat) {
        self.isOpen = true
        
        // x: 48, y: 8 は左上(0, 0)基準
        let pointX = -128 + 48
        let pointY = 112 - 8
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 12
        let numberOfRows = 8
        
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
        
        // ドだけ濁点が上に飛び出ない特別フォント
        showWord(windowNode: self,
                 word: "コマン度",
                 pointX: 32,
                 pointY: -8)
        
        showWord(windowNode: self,
                 word: "はなす",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "じゅもん",
                 pointX: 56,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "つよさ",
                 pointX: 16,
                 pointY: -40)
        
        showWord(windowNode: self,
                 word: "どうぐ",
                 pointX: 56,
                 pointY: -40)
        
        showWord(windowNode: self,
                 word: "そうび",
                 pointX: 16,
                 pointY: -56)
        
        showWord(windowNode: self,
                 word: "しらべる",
                 pointX: 56,
                 pointY: -56)
        
        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        scene.addChild(self)
    }
}

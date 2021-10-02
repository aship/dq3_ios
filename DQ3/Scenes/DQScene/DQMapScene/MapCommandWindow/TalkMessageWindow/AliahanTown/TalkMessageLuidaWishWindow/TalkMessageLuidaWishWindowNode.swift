//
//  TalkMessageLuidaWishWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/06.
//

import SpriteKit

class TalkMessageLuidaWishWindowNode: SKTileMapNode {
    var triangleNode = SKSpriteNode()
    var triangleMoving = false
    var triangleIndex = 0
    
    enum DQLuidaWish {
        case add_member // なかまをくわえる
        case break_up_with_member // なかまをはずす
        case see_list // めいぼをみる
    }
    
    var dqLuidaWish: DQLuidaWish = .add_member
    
    let dqLuidaWishes: [DQLuidaWish] = [.add_member,
                                        .break_up_with_member,
                                        .see_list]
    
    func addToWindow(windowNode: SKTileMapNode) {
        let pointX = 112
        let pointY = 96
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        self.tileSet = tileSet
        self.numberOfColumns = 12
        self.numberOfRows = 8
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
                 word: "なかまを くわえる",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: self,
                 word: "なかまと わかれる",
                 pointX: 16,
                 pointY: -24 - 16)
        
        showWord(windowNode: self,
                 word: "めいぼを みる",
                 pointX: 16,
                 pointY: -24 - 16 * 2)
        
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX),
                                y: CGFloat(pointY))
        windowNode.addChild(self)
    }
}

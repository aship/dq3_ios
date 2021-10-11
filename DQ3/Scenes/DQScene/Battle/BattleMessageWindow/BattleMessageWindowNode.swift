//
//  BattleMessageWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/18.
//

import SpriteKit

class BattleMessageWindowNode: SKTileMapNode {
    private(set) var battleScene: BattleScene!
    
    var isOpen = false
    var arrLines: [[SKSpriteNode]] = []
    var nextMark: SKSpriteNode!
    
    var battleGoldWindowNode: BattleGoldWindowNode?
    
    init(battleScene: BattleScene?) {
        super.init()
        
        self.battleScene = battleScene
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func close() {
        self.isOpen = false
        self.removeFromParent()
    }
    
    func addToScene(scene: SKScene,
                    scale: CGFloat) {
        self.isOpen = true
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 24
        let numberOfRows = 10
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        
        let pointX = BattleMessageWindowChildOfScenePointX
        let pointY = BattleMessageWindowChildOfScenePointY
        
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        scene.addChild(self)
    }
}

//
//  MapMessageWindowNode.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class MapMessageWindowNode: SKTileMapNode {
    var isOpen = false

    var arrLines: [[SKSpriteNode]] = []
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/MapMessageWindow/MapMessageWindowNode.swift

========
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/MapMessageWindow/MapMessageWindowNode.swift
    var nextMark: SKSpriteNode!

    func close() {
        self.isOpen = false
        self.removeFromParent()
    }
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/MapMessageWindow/MapMessageWindowNode.swift

    func addToScene<T: SKNode>(
        node: T,
        pointX: Int,
        pointY: Int,
        scale: CGFloat
    ) {
        self.removeFromParent()

========
    
    func addToScene<T: SKNode>(node: T,
                               pointX: Int,
                               pointY: Int,
                               scale: CGFloat) {
        self.isOpen = true
        
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/MapMessageWindow/MapMessageWindowNode.swift
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)

        let numberOfColumns = 20
        let numberOfRows = 10

        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8

        setWindow(
            tileMapNode: self,
            numberOfColumns: numberOfColumns,
            numberOfRows: numberOfRows,
            tileSet: tileSet)

        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(
            x: CGFloat(pointX) * scale,
            y: CGFloat(pointY) * scale)
        node.addChild(self)
    }
}

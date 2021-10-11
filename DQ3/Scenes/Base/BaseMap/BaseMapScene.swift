//
//  BaseMapScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class BaseMapScene: BaseScene {
    var mainTileMapNode: SKTileMapNode!
    var insideTileMapNode: SKTileMapNode!
    
    var mapMessageWindowNode = MapMessageWindowNode()
    
    let heroNode = SKSpriteNode(imageNamed: "\(ImagePathHero)/down1.png")
    
    var isMoving = false
    var isMovePermitted = true
    
    var showInsideMap = false
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
}

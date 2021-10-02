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
    
    var mapCommandWindowNode = MapCommandWindowNode()
    var mapMessageWindowNode = MapMessageWindowNode()
        
    let heroNode = SKSpriteNode(imageNamed: "\(ImagePathHero)/down1.png")
    let warriorNode = SKSpriteNode(imageNamed: "\(ImagePathWarriorFemale)/down1.png")
    let priestNode = SKSpriteNode(imageNamed: "\(ImagePathPriestFemale)/down1.png")
    let mageNode = SKSpriteNode(imageNamed: "\(ImagePathMageFemale)/down1.png")
    
    var isMoving = false
    var isMovePermitted = true
    
    var showInsideMap = false
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
}

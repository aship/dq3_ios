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
    
    let heroNode = SKSpriteNode(texture: nil, size: CGSize(width: 16, height: 16))
    let warriorNode = SKSpriteNode(texture: nil, size: CGSize(width: 16, height: 16))
    let priestNode = SKSpriteNode(texture: nil, size: CGSize(width: 16, height: 16))
    let mageNode = SKSpriteNode(texture: nil, size: CGSize(width: 16, height: 16))
    
    var direction: Direction = .neutral
    var direction2nd: Direction = .neutral
    var direction3rd: Direction = .neutral
    var direction4th: Direction = .neutral
    
    var isMoving = false
    var isMovePermitted = true
    
    var showInsideMap = false
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
}

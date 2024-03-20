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

    let heroNode = SKSpriteNode(
        texture: nil,
        size: CGSize(width: 16, height: 16))

    var direction: Direction = .neutral

    var isMoving = false
    var isMovePermitted = true

    var showInsideMap = false

    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
}

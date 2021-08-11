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
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
}

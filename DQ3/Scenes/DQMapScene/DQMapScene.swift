//
//  DQMapScene.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

class DQMapScene {
    var mainTileMapNode: SKTileMapNode!
    var insideTileMapNode: SKTileMapNode!
    
    var commandWindowNode = SKTileMapNode()
    var messageWindowNode = SKTileMapNode()
    
    var isCommandWindowOpen = false
    var isMessageWindowOpen = false
    
    var characterNpcNodes: [CharacterNode] = []
    var enterBattlePoint: Int = 0
    
    var scene: BaseMapScene!
    
    init(scene: BaseMapScene) {
        self.scene = scene
    }
}

//
//  DQMapScene.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

class DQMapScene: DQScene {
    var enterBattlePoint: Int = 0

    let nightOverlayNode = SKSpriteNode()

    var mainTileMapNode: SKTileMapNode!
    var insideTileMapNode: SKTileMapNode!

    var mapCommandWindowNode = MapCommandWindowNode(characterNpcNodes: [])
    var mapStatusWindowNode = MapStatusWindowNode()
    var mapMessageWindowNode = MapMessageWindowNode()

    var characterNpcNodes: [CharacterNode] = []
}

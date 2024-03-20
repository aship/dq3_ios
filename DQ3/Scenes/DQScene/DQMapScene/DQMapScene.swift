//
//  DQMapScene.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

class DQMapScene: DQScene {
    var enterBattlePoint: Int = 0
    
    var mainTileMapNode: SKTileMapNode!
    var insideTileMapNode: SKTileMapNode!

    var mapMessageWindowNode = MapMessageWindowNode()

    var characterNpcNodes: [CharacterNode] = []
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/DQMapScene.swift
    var enterBattlePoint: Int = 0

    var scene: BaseMapScene!

    init(scene: BaseMapScene) {
        self.scene = scene
    }
========
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/DQMapScene.swift
}

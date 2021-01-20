//
//  DQScene.swift
//  DQ3
//
//  Created by aship on 2021/01/04.
//

import SpriteKit

class DQScene {
    var scene: BaseScene!
    
    init(scene: BaseScene,
         dqSceneType: DQSceneType) {
        self.scene = scene
        
        DataManager.dqSceneType = dqSceneType
    }
}

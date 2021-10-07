//
//  AdventureLogScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class AdventureLogScene: DQScene {
    var adventureLogTopWindowNode: AdventureLogTopWindowNode?
    var isProcessing = false
    
    func setup() {
        DataManager.dqMainState = .select_adventure_log
        
        self.scene.backgroundColor = .black
        
        self.scene.leftPad.isHidden = false
        self.scene.buttonA.isHidden = false
        self.scene.buttonB.isHidden = false
        
        self.adventureLogTopWindowNode = AdventureLogTopWindowNode()
        self.adventureLogTopWindowNode?.addToScene(scene: self.scene,
                                                   numberOfAdventureLogs: 1,
                                                   scale: self.scene.scale)
    }
}

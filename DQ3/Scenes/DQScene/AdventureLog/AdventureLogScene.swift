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
        DataManager.adventureLog.dqSceneType = .adventure_log
        
        self.scene.backgroundColor = .black
        
        self.scene.leftPad.isHidden = false
        self.scene.buttonA.isHidden = false
        self.scene.buttonB.isHidden = false
        
        let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
        let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
        let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)
        
        let numberOfAdventureLogs = getNumberOfAdventureLogs(adventureLog1: adventureLog1,
                                                             adventureLog2: adventureLog2,
                                                             adventureLog3: adventureLog3)
        
        self.adventureLogTopWindowNode = AdventureLogTopWindowNode()
        self.adventureLogTopWindowNode?.addToScene(scene: self.scene,
                                                   numberOfAdventureLogs: numberOfAdventureLogs,
                                                   scale: self.scene.scale)
    }
}

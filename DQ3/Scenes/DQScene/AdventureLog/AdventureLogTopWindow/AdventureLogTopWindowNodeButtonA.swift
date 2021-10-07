//
//  AdventureLogTopWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogTopWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        SoundEffectManager.play(.command)
        
        DataManager.scene.adventureLogScene?.setProcessing()
        
        DataManager.dqMainState = .adventure_log_loaded
        
        let adventureLog = DataManager.adventureLog
        
        self.parentScene?.transitionToMap(
            isFromAdventureLog: true,
            dqSceneTypeTo: adventureLog.dqSceneType,
            dqAudio: .none)
    }
}

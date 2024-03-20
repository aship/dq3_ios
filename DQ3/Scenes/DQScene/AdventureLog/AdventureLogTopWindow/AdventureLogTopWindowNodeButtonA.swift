//
//  AdventureLogTopWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogTopWindowNode {
    func processButtonA() {
        if !self.isProcessing {
            self.isProcessing = true
            
            pauseTriangleAnimation(triangleNode: self.triangleNode)
            
            SoundEffectManager.play(.command)
            
            DataManager.dqMainState = .adventure_log_loaded
            
            let adventureLog = DataManager.adventureLog
            
            let scene = self.parent as! BaseScene
            
            scene.transitionToMap(
                isFromAdventureLog: true,
                dqSceneTypeTo: adventureLog.dqSceneType,
                dqAudio: .none)
        }
    }
}

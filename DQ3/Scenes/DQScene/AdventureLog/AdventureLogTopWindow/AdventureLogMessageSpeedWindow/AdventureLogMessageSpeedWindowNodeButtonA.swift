//
//  AdventureLogMessageSpeedWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/17.
//


import SpriteKit

extension AdventureLogMessageSpeedWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        SoundEffectManager.play(.command)
        
        let adventureLogNumber = self.adventureLogNumber!
        let messageSpeed = self.triangleIndex + 1
        
        if self.dqAdventureLogTop == .create {
            DataManager.scene.adventureLogScene?.setProcessing()
            
            let adventureLog = DataManager.adventureLog
            adventureLog.messageSpeed = messageSpeed
            
            UserDefaultsUtil.saveAdventureLog(adventureLog: adventureLog,
                                              number: adventureLogNumber)
            
            DataManager.scene.transitionToMap(dqSceneTypeFrom: .adventure_log,
                                              dqSceneTypeTo: .opening,
                                              dqAudio: .none)
        }
        else if self.dqAdventureLogTop == .change_message_speed {
            let adventureLog = UserDefaultsUtil.loadAdventureLog(number: adventureLogNumber)!
            adventureLog.messageSpeed = messageSpeed
            
            UserDefaultsUtil.saveAdventureLog(adventureLog: adventureLog,
                                              number: adventureLogNumber)
            
            reloadAdventureLogScene()
        }
    }
}

//
//  BaseSceneAudio.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import SpriteKit

extension BaseScene {
    func playSoundEffect(_ soundEffect: DQSoundEffect) {
        let filename = "\(soundEffect.rawValue).mp3"
        
        let action = SKAction.playSoundFileNamed(
            filename,
            waitForCompletion: true)
        
        self.run(action)
    }
}

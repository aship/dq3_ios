//
//  BaseSceneAudio.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import SpriteKit

extension BaseScene {
    func playSoundEffect(_ soundEffect: DQSoundEffect) {
        let action = SKAction.playSoundFileNamed("\(soundEffect.rawValue).mp3",
                                                 waitForCompletion: true)
        self.run(action)
    }
}

//
//  AdventureLogScenePad.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            if self.isProcessing {
                return
            }
            
            setProcessing()
            
            self.scene.playSoundEffect(.command)
            
            hideMessageWindow()
            
            self.scene.transitionToMap(dqSceneType: .opening,
                                       dqAudio: .none)
        }
        else if button == self.scene.buttonB {
        }
    }
}

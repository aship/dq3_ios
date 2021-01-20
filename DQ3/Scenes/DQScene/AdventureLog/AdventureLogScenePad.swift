//
//  AdventureLogScenePad.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    //    func padOverlayVirtualStickInteractionDidStart(_ padNode: PadOverlay) {
    //    }
    //
    //    func padOverlayVirtualStickInteractionDidChange(_ padNode: PadOverlay) {
    //        self.padDirection = getDirection(stickPositionX: padNode.stickPosition.x,
    //                                         stickPositionY: padNode.stickPosition.y)
    //    }
    //
    //    func padOverlayVirtualStickInteractionDidEnd(_ padNode: PadOverlay) {
    //        self.padDirection = .neutral
    //    }
    
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
        
        if button == self.scene.buttonB {
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}

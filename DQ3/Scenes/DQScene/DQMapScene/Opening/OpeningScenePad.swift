//
//  OpeningScenePad.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

extension OpeningScene {
    func padOverlayVirtualStickInteractionDidStart(_ padNode: PadOverlay) {
    }
    
    func padOverlayVirtualStickInteractionDidChange(_ padNode: PadOverlay) {
    }
    
    func padOverlayVirtualStickInteractionDidEnd(_ padNode: PadOverlay) {
    }
    
    func willPress(_ button: ButtonOverlay) {
        if self.sceneFlag == .transition {
            return
        }
        
        if self.sceneFlag == .message_1 {
            self.sceneFlag = .message_2
            
            let text = "＊「おきなさい。\n　おきなさい　わたしの　かわいい\n　えにくすや……。"
            
            self.showMessage(text: text,
                             numberOfLine: 3)
        }
        else if self.sceneFlag == .message_2 {
            self.sceneFlag = .transition
            
            self.hideMessageWindow()
            
            self.scene.transitionToMap(dqSceneType: .aliahan_town_house,
                                       dqAudio: .town)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}

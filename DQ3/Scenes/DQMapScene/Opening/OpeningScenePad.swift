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
        if self.sceneFlag == .message_1 {
            let text = "＊「おきなさい。\n　おきなさい　わたしの　かわいい\n　えにくすや……。"
            
            showMessage(text: text,
                        numberOfLine: 3)
            
            self.sceneFlag = .message_2
        }
        else if self.sceneFlag == .message_2 {
            hideMessageWindow()
            
            let scene = BaseMapScene()
            
            let transition = SKTransition.crossFade(withDuration: 0.5)
            self.view?.presentScene(scene,
                                    transition: transition)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}

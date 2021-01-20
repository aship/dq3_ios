//
//  OpeningSceneButton.swift
//  DQ3
//
//  Created by aship on 2021/01/19.
//

import SpriteKit

extension OpeningScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            if self.sceneFlag == .message_1_start ||
                self.sceneFlag == .message_2_start ||
                self.sceneFlag == .transition {
                return
            }
            
            if self.sceneFlag == .message_1_end {
                self.sceneFlag = .message_2_start
                let text1 = "＊「おきなさい。"
                let text2 = "　　おきなさい　わたしの　かわいい"
                let text3 = "　　えにくすや……。"
                
                showMessages(text1: text1,
                             text2: text2,
                             text3: text3,
                             withSe: true,
                             withNextMark: false,
                             messageWindowNode: &self.messageWindowNode,
                             isMessageWindowOpen: &self.isMessageWindowOpen,
                             scale: self.scene.scale,
                             completion: {
                                self.sceneFlag = .message_2_end
                             })
            }
            else if self.sceneFlag == .message_2_end {
                self.sceneFlag = .transition
                
                closeMessageWindow(messageWindowNode: self.messageWindowNode,
                                   isMessageWindowOpen: &self.isMessageWindowOpen)
                
                self.scene.transitionToMap(
                    dqSceneType: .aliahan_town_house,
                    dqAudio: .town)
            }
        }
    }
}

//
//  AliahanTownSceneButtonAOpening.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension AliahanTownScene {
    func processButtonAOpening(commandWindowNode: SKTileMapNode,
                               messageWindowNode: SKTileMapNode,
                               openingStateFlag: inout OpeningStateFlag) {
        if openingStateFlag == .mother_moving ||
            openingStateFlag == .message_one_start ||
            openingStateFlag == .message_two_start ||
            openingStateFlag == .finished {
            return
        }
        
        if openingStateFlag == .message_one_end {
            openingStateFlag = .message_two_start
            
            let text1 = "＊「おうさまに　ちゃんと"
            let text2 = "　　あいさつ　するのですよ。"
            let text3 = "　　さあ　いってらっしゃい。"
            
            showMessages(text1: text1,
                         text2: text2,
                         text3: text3,
                         withSe: true,
                         withNextMark: false,
                         messageWindowNode: &self.messageWindowNode,
                         isMessageWindowOpen: &self.isMessageWindowOpen,
                         scale: self.scale,
                         completion: {
                            self.openingStateFlag = .message_two_end
                         })
        }
        else if openingStateFlag == .message_two_end {
            setMovePermitted()
            
            closeMessageWindow(messageWindowNode: self.messageWindowNode,
                               isMessageWindowOpen: &self.isMessageWindowOpen)
            
            openingStateFlag = .finished
            dqStory = .mother_waiting
        }
    }
}

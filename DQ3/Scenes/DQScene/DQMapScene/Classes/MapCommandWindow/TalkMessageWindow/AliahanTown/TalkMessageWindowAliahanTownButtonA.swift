//
//  TalkMessageWindowAliahanTownButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/29.
//

import SpriteKit

extension TalkMessageWindowAliahanTown {
    func processButtonA() {
        let headNode = DataManager.characterNodes.first!
        
        let values = processTalk(headNode: headNode)
        let withSe = values.0
        let withNextMark = values.1
        let closeWindow = values.2
        let text1 = values.3
        let text2 = values.4
        let text3 = values.5
        
        if self.lady1MessageFlag == .message2 {
            processLady1Message2(text1: text1,
                                 text2: text2!)
            return
        }
        
        if self.oldMan1MessageFlag == .message2 {
            processOldMan1Message2(text1: text1,
                                   text2: text2!)
            return
        }
        
        if self.oldMan1MessageFlag == .message3 {
            processOldMan1Message3(text1: text1,
                                   text2: text2!,
                                   text3: text3!)
            return
        }
        
//        if self.oldMan2MessageFlag == .message1 {
//            processOldMan1Message1(text1: text1,
//                                   text2: text2!,
//                                   text3: text3!)
//            return
//        }
        
        showMessages(
            scene: self,
            text1: text1,
            text2: text2,
            text3: text3,
            withSe: withSe,
            withNextMark: withNextMark,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY,
            scale: 1,
            completion: {
                if closeWindow == true {
                    self.parentNode.commandWindowStatus = .should_close
                }
                else {
                    self.parentNode.commandWindowStatus = .open
                }
            })
    }
}

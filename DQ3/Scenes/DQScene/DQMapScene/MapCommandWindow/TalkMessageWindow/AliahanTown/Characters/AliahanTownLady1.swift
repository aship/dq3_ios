//
//  AliahanTownLady1.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processLady1ButtonA() {
        if self.lady1MessageFlag == .none {
            self.lady1MessageFlag = .message1
            
            let text1 = "＊「ここは　アリアハンの"
            let text2 = "　　じょうかまち。"
            let withNextMark = true
            
            showMessages(
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: withNextMark,
                completion: {
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .prompt
                })
        }
        else if self.lady1MessageFlag == .message1 {
            self.lady1MessageFlag = .message2
            
            let text1 = "＊「きたにいくと　レーベのむら"
            let text2 = "　　ありますわ。"
            
            // 最後の ▼ を消す
            self.nextMark.removeFromParent()
            
            showMessage(string: text1,
                        line: 2,
                        withSe: true,
                        completion: {
                            self.showMessage(string: text2,
                                             line: 3,
                                             withSe: true,
                                             completion: {
                                                self.moveLine()
                                                self.lady1MessageFlag = .none
                                                
                                                let parent = self.parent as! MapCommandWindowNode
                                                parent.commandWindowStatus = .should_close
                                             })
                        })
        }
    }
}

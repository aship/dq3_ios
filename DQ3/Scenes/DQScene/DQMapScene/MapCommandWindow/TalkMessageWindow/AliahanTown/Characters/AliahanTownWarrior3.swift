//
//  AliahanTownWarrior3.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processWarrior3ButtonA() {
        if self.warrior3MessageFlag == .none {
            self.warrior3MessageFlag = .message1
            let text1 = "＊「アリアハンは　うみに"
            let text2 = "　　かこまれた　たいりく　なのだ。"
            
            showMessages(
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: true,
                completion: {
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .prompt
                })
        }
        else if self.warrior3MessageFlag == .message1 {
            self.warrior3MessageFlag = .message2
            let text1 = "＊「しかし　うみのむこうには"
            let text2 = "　　もっと　おおきな"
            let text3 = "　　たいりくがあるというぞ。"
            
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
                                                
                                                self.showMessage(string: text3,
                                                                 line: 3,
                                                                 withSe: true,
                                                                 completion: {
                                                                    self.moveLine()
                                                                    self.warrior3MessageFlag = .none
                                                                    
                                                                    let parent = self.parent as! MapCommandWindowNode
                                                                    parent.commandWindowStatus = .should_close
                                                                 })
                                             })
                        })
        }
    }
}

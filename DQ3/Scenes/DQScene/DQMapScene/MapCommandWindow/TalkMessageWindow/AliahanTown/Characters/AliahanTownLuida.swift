//
//  AliahanTownLuida.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processLuidaButtonA() {
        if self.luidaMessageFlag == .none {
            self.luidaMessageFlag = .message1
            
            let text1 = "＊「ここはルイーダのみせ。"
            
            showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: true,
                withNextMark: true,
                completion: {
                    // 暫定処理
                    self.addParties()
                    
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .prompt
                })
        }
        else if self.luidaMessageFlag == .message1 {
            self.luidaMessageFlag = .message2
            
            let text1 = "*「たびびとたちが"
            let text2 = "  なかまをもとめて あつまる"
            let text3 = "  であいと わかれの さかばよ。"
            
            // 最後の ▼ を消す
            self.nextMark.removeFromParent()
            
            showMessage(string: text1,
                        line: 1,
                        withSe: true,
                        completion: {
                            self.showMessage(string: text2,
                                             line: 2,
                                             withSe: true,
                                             completion: {
                                                self.showMessage(string: text3,
                                                                 line: 3,
                                                                 withSe: true,
                                                                 completion: {
                                                                    self.moveLine()
                                                                    self.showNextMark(line: 3)
                                                                    
                                                                    let parent = self.parent as! MapCommandWindowNode
                                                                    parent.commandWindowStatus = .prompt
                                                                 })
                                             })
                        })
            
        }
        else if self.luidaMessageFlag == .message2 {
            self.luidaMessageFlag = .message3
            
            let text1 = "*「なにを おのぞみかしら?"
            
            // 最後の ▼ を消す
            self.nextMark.removeFromParent()
            
            showMessage(string: text1,
                        line: 3,
                        withSe: true,
                        completion: {
                            self.moveLine()
                            
                            let parent = self.parent as! MapCommandWindowNode
                            parent.commandWindowStatus = .prompt
                            
                            // なかまを くわえる
                            // なかまと わかれる
                            // めいぼを みる
                            
                            self.talkMessageLuidaWishWindowNode = TalkMessageLuidaWishWindowNode()
                            self.talkMessageLuidaWishWindowNode?.addToWindow(windowNode: self)
                            
                        })
            
        }
    }
}

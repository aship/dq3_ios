//
//  AliahanTownLuida.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processLuidaButtonA() {

        let aliahanTownTalkMessageYesNoWindowNode = self.aliahanTownTalkMessageYesNoWindowNode

        if aliahanTownTalkMessageYesNoWindowNode.isOpen {
            aliahanTownTalkMessageYesNoWindowNode.processButtonA()

            return
        }

        let talkMessageLuidaWishWindowNode = self.talkMessageLuidaWishWindowNode

        if talkMessageLuidaWishWindowNode.isOpen {
            talkMessageLuidaWishWindowNode.processButtonA()

            return
        }

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
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .prompt
                })

            return
        }

        if self.luidaMessageFlag == .message1 {
            self.luidaMessageFlag = .message2

            let text1 = "*「たびびとたちが"
            let text2 = "  なかまをもとめて あつまる"
            let text3 = "  であいと わかれの さかばよ。"

            self.nextMark.removeFromParent()

            Task {
                await showMessage(
                    string: text1,
                    line: 1,
                    withSe: true)

                await showMessage(
                    string: text2,
                    line: 2,
                    withSe: true)

                await showMessage(
                    string: text3,
                    line: 3,
                    withSe: true)
                self.moveLine()
                self.showNextMark(line: 3)

                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .prompt
            }

            return
        }

        if self.luidaMessageFlag == .message2 {
            self.luidaMessageFlag = .message3

            let text = "*「なにを おのぞみかしら?"

            self.nextMark.removeFromParent()

            Task {
                await showMessage(
                    string: text,
                    line: 3,
                    withSe: true)

                self.moveLine()

                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .prompt

                // なかまを くわえる
                // なかまと わかれる
                // めいぼを みる

                self.talkMessageLuidaWishWindowNode = TalkMessageLuidaWishWindowNode()
                self.talkMessageLuidaWishWindowNode.addToWindow(windowNode: self)
            }

            return
        }
    }
}

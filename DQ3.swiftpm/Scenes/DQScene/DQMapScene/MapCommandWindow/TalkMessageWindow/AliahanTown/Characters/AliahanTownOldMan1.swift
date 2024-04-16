//
//  AliahanTownOldMan1.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processOldMan1ButtonA() {
        if self.oldMan1MessageFlag == .none {
            self.oldMan1MessageFlag = .message1

            let text1 = "＊「かつて　アリアハンは"
            let text2 = "　　すべてのせかいを　おさめていた"
            let text3 = "　　のじゃ。"

            let withNextMark = true

            showMessages(
                text1: text1,
                text2: text2,
                text3: text3,
                withSe: true,
                withNextMark: withNextMark,
                completion: {
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .prompt
                })

            return
        }

        if self.oldMan1MessageFlag == .message1 {
            self.oldMan1MessageFlag = .message2

            let text1 = "＊「しかし　せんそうがおこって"
            let text2 = "　　おおくの　ひとびとが　しんだ。"

            self.nextMark.removeFromParent()

            Task {
                await showMessage(
                    string: text1,
                    line: 3,
                    withSe: true)

                self.moveLine()

                await self.showMessage(
                    string: text2,
                    line: 3,
                    withSe: true)

                self.moveLine()
                self.showNextMark(line: 3)

                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .prompt
            }

            return
        }

        if self.oldMan1MessageFlag == .message2 {
            self.oldMan1MessageFlag = .message3

            let text1 = "＊「そして　うみのむこうにつうじる"
            let text2 = "　　たびのとびらを"
            let text3 = "　　ふうじこめたのじゃ。"

            self.nextMark.removeFromParent()

            Task {
                await showMessage(
                    string: text1,
                    line: 3,
                    withSe: true)
                moveLine()

                await showMessage(
                    string: text2,
                    line: 3,
                    withSe: true)
                moveLine()

                await showMessage(
                    string: text3,
                    line: 3,
                    withSe: true)
                moveLine()

                self.oldMan1MessageFlag = .none

                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .should_close
            }

            return
        }
    }
}

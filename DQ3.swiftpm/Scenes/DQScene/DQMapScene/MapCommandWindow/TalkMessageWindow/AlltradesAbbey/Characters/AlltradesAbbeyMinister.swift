//
//  AlltradesAbbeyMinister.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

extension TalkMessageWindowNodeAlltradesAbbey {
    func processMinisterButtonA() {
        if self.ministerMessageFlag == .none {
            self.ministerMessageFlag = .message1
            let text1 = "*「ダーマのしんでんに"
            let text2 = "  よくぞきた!"
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

            return
        }

        if self.ministerMessageFlag == .message1 {
            self.ministerMessageFlag = .message2

            let text1 = "*「あしひーは もう"
            let text2 = "  じゅうぶんに つよい!"

            self.nextMark.removeFromParent()

            Task {
                await showMessage(
                    string: text1,
                    line: 2,
                    withSe: true)

                await showMessage(
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

        if self.ministerMessageFlag == .message2 {
            self.ministerMessageFlag = .message3

            let text1 = "*「そなたらの たびのせいかを"
            let text2 = "  この ぼうけんのしょに"
            let text3 = "  きろくしても よいかな?"

            self.nextMark.removeFromParent()

            Task {
                await showMessage(
                    string: text1,
                    line: 3,
                    withSe: true)

                self.moveLine()

                await showMessage(
                    string: text2,
                    line: 3,
                    withSe: true)

                self.moveLine()

                await showMessage(
                    string: text3,
                    line: 3,
                    withSe: true)
                self.moveLine()

                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .prompt

                self.alltradesAbbeyTalkMessageYesNoWindowNode =
                    AlltradesAbbeyTalkMessageYesNoWindowNode(name: self.name!)
                self.alltradesAbbeyTalkMessageYesNoWindowNode.addToWindow(windowNode: self)
            }

            return
        }

        if self.ministerMessageFlag == .ask_going_now {
            showAskGoingNow(windowNode: self)
        }
    }
}

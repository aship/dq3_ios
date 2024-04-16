//
//  AliahanTownOldMan2.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processOldMan2ButtonA(name: String) {
        let text1 = "＊「このしろの　にしに"
        let text2 = "　　うかぶ　しまを"
        let text3 = "　　もう　みなさったか？"

        showMessages(
            text1: text1,
            text2: text2,
            text3: text3,
            withSe: true,
            withNextMark: false,
            completion: {
                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .prompt

                self.aliahanTownTalkMessageYesNoWindowNode = AliahanTownTalkMessageYesNoWindowNode(
                    name: name)
                self.aliahanTownTalkMessageYesNoWindowNode.addToWindow(windowNode: self)
            })
    }
}

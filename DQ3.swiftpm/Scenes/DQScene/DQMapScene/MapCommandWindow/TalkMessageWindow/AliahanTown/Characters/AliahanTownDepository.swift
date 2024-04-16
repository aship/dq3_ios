//
//  AliahanTownDepository.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processDepositoryButtonA() {
        let text1 = "＊「ここは　あずかりじょです。"
        let text2 = "＊「どんな　ごようでしょう？"

        showMessages(
            text1: text1,
            text2: text2,
            text3: nil,
            withSe: true,
            withNextMark: false,
            completion: {
                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .should_close
            })
    }
}

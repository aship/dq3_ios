//
//  AliahanTownWarrior1.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processWarrior1ButtonA() {
        let text1 = "*「つれてゆくなら"
        let text2 = "  せんし そうりょ まほうつかいの"
        let text3 = "  3にんが いいぜ。ひっく。"
        
        showMessages(
            text1: text1,
            text2: text2,
            text3: text3,
            withSe: true,
            withNextMark: false,
            completion: {
                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .should_close
            })
    }
}

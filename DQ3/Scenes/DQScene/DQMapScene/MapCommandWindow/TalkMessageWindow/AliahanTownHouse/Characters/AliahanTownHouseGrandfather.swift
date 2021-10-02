//
//  AliahanTownHouseGrandfather.swift
//  DQ3
//
//  Created by aship on 2021/04/22.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTownHouse {
    internal func processGrandfatherButtonA() {
        let text1 = "＊「おまえの　ちちオルテガは"
        let text2 = "　　りっぱな　ゆうしゃじゃった。"
        let text3 = "　　このじいの　むすこじゃ！"
        
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

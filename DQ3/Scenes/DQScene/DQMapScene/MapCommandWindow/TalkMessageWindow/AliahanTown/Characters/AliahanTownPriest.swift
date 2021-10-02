//
//  AliahanTownPriest.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processPriestButtonA() {
        let text1 = "＊「たのもしき　カミの　しもべよ"
        let text2 = "　　わが　きょうかいに　どんな"
        let text3 = "　　ごようじゃな？"
        
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

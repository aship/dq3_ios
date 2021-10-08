//
//  AliahanTownBoy2.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processBoy2ButtonA() {
        let text1 = "＊「まちのそとに　でで"
        let text2 = "　　ながくあるけば　やがて　よるに"
        let text3 = "　　なります。"
        
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

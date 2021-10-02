//
//  AliahanTownLady2.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processLady2ButtonA() {
        let  text1 = "＊「まちのなかにいると"
        let  text2 = "　　まおうが　せかいをほろぞすなど"
        let  text3 = "　　まるで　うそのようですわ。"
        
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

//
//  AliahanTownWarrior2.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processWarrior2ButtonA() {
        let text1 = "＊「あなたが　あの　ゆうかんだった"
        let text2 = "　　オルテガの　むすこさんか？"
        let text3 = "　　おちちうえは　りっぱでしたぞ！"

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

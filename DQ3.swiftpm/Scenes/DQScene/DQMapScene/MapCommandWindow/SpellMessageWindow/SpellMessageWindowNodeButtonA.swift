//
//  SpellMessageWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/05/07.
//

import SpriteKit

extension SpellMessageWindowNode {
    func processButtonA() {
        let text1 = "じゅもんを　おぼえて　いない。"

        showMessages(
            text1: text1,
            text2: nil,
            text3: nil,
            withSe: false,
            withNextMark: false,
            completion: {
                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .should_close
            })
    }
}

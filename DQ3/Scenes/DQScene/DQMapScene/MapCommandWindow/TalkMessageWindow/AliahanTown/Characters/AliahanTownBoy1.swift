//
//  AliahanTownBoy1.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processBoy1ButtonA() {
        let text1 = "＊「おしろから　うみづたいを"
        let text2 = "　　あること　みさきの　どうくつが"
        let text3 = "　　あるそうです。"
        
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

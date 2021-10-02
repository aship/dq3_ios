//
//  AliahanTownMother.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processMotherButtonA() {
        let text1 = "＊「えにくすや　どうしたの？"
        let text2 = "　　おうさまに　あっていらっしゃい。"
        
        let withSe = true
        let withNextMark = true
        
        showMessages(
            text1: text1,
            text2: text2,
            text3: nil,
            withSe: withSe,
            withNextMark: withNextMark,
            completion: {
                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .should_close
            })
    }
}

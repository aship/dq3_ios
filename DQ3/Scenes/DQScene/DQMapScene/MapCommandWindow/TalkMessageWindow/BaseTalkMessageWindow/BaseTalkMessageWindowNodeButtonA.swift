//
//  BaseTalkMessageWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/28.
//

import SpriteKit

extension BaseTalkMessageWindowNode {
    @objc func processButtonA() {
        showDefaultTalkMessage()
    }
    
    func showDefaultTalkMessage() {
        let text1 = "そのほうこうには　だれも　いない。"
        
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

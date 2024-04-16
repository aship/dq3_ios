//
//  AliahanTownInn.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    func processInnButtonA() {
        let text1 = "＊「こんにちは"
        let text2 = "　　たびびとの　やどに　ようこそ。"
        //
        //                //                    text = "＊「ひとばん　２ゴールドですが\n　おとまりに　なりますか？"
        //                //                    numberOfLine = 2

        showMessages(
            text1: text1,
            text2: text2,
            text3: nil,
            withSe: true,
            withNextMark: false,
            completion: {
                let parent = self.parent as! MapCommandWindowNode
                parent.commandWindowStatus = .should_close
            })
    }
}

//
//  AliahanTownWeapon.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    internal func processWeaponShopButtonA() {
        let text1 = "＊「ここは　ぶきと　ぼうぐのみせだ。"
        let text2 = "　　うってるものを　みるかね？"
        
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

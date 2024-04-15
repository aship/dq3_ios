//
//  BattleMessageWindowNodeMessage.swift
//  DQ3
//
//  Created by aship on 2021/05/18.
//

import SpriteKit

extension BattleMessageWindowNode {
    func showMessage(
        string: String,
        line: Int
    ) {
        let BaseX = 8
        let BaseY = -24 - 16 * line

        for (index, letter) in string.enumerated() {
            let node = DQFont.getFont(string: String(letter))
            node.position = CGPoint(
                x: BaseX + 8 * index,
                y: BaseY)
            self.addChild(node)
        }
    }
}

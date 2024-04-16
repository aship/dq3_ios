//
//  BattleMessageWindowNodeLine.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

extension BattleMessageWindowNode {
    func moveLine() {
        // 全体を一つ上にずらす
        for line in self.arrLines {
            for letter in line {
                let action = SKAction.moveBy(
                    x: 0,
                    y: 16,
                    duration: 0)
                letter.run(action)
            }
        }

        // 最初の行を消す
        let lastLine = self.arrLines.first!

        for letter in lastLine {
            letter.removeFromParent()
        }

        self.arrLines.removeFirst()
    }
}

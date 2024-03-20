//
//  MapMessageWindowNodeLine.swift
//  DQ3
//
//  Created by aship on 2021/02/06.
//

import SpriteKit

extension MapMessageWindowNode {
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

//
//  BattleMessageWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

extension BattleMessageWindowNode {
    func processButtonA() {
        if let battleGoldWindowNode = self.battleGoldWindowNode {
            battleGoldWindowNode.processButtonA()

            return
        }
    }
}

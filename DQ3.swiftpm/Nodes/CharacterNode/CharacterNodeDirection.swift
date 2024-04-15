//
//  CharacterNodeDirection.swift
//  DQ3
//
//  Created by aship on 2020/12/25.
//

import SpriteKit

extension CharacterNode {
    // 初期化時に方向をセット
    func initDirection(direction: Direction) {
        self.direction = direction

        let action = getCharacterAnimationAction(
            direction: direction,
            dqCharacter: self.dqCharacter)
        self.run(action)
    }

    // 初期化後に方向を変える
    func changeDirection(direction: Direction) {
        if self.direction == direction {
            return
        }

        initDirection(direction: direction)
    }

    func setTexture(direction: Direction) {
        let dqVocation = DQVocation(rawValue: dqCharacter.rawValue)

        var type = "vocation"

        if dqVocation == nil {
            type = "npc"
        }

        let imagePath = "character/\(type)/\(dqCharacter.rawValue)"
        let imageName = "\(imagePath)/\(direction.rawValue)1.png"

        self.texture = SKTexture(imageNamed: imageName)
    }
}

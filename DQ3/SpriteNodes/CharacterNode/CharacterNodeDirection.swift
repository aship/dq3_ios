//
//  CharacterNodeDirection.swift
//  DQ3
//
//  Created by aship on 2020/12/25.
//

import SpriteKit

extension CharacterNode {
    func setDirection(direction: Direction) {
        if self.direction == direction {
            return
        }
        
        self.direction = direction

        let action = getCharacterAnimationAction(direction: direction,
                                                 dqCharacter: self.dqCharacter)
        self.run(action)
    }
}

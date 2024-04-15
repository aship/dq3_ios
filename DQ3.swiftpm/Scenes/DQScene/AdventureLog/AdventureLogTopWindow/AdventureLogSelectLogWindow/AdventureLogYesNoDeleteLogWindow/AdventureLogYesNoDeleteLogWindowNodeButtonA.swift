//
//  AdventureLogYesNoDeleteLogWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/15.
//

import SpriteKit

extension AdventureLogYesNoDeleteLogWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)

        SoundEffectManager.play(.command)

        if self.dqYesNo == .yes {
            UserDefaultsUtil.deleteAdventureLog(number: self.adventureLogNumber)
        }

        reloadAdventureLogScene()
    }
}

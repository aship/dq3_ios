//
//  AdventureLogSelectLogWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogSelectLogWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)

        let dqAdventureLogTop = self.dqAdventureLogTop!

        if dqAdventureLogTop == .change_message_speed {
            if let adventureLogMessageSpeedWindowNode = self.adventureLogMessageSpeedWindowNode {
                adventureLogMessageSpeedWindowNode.processButtonA()

                return
            }
        }

        if dqAdventureLogTop == .delete {
            if let adventureLogYesNoDeleteLogWindowNode = self.adventureLogYesNoDeleteLogWindowNode
            {
                adventureLogYesNoDeleteLogWindowNode.processButtonA()

                return
            }
        }

        if dqAdventureLogTop == .copy {
            if let adventureLogSelectEmptyLogWindowNode = self.adventureLogSelectEmptyLogWindowNode
            {
                adventureLogSelectEmptyLogWindowNode.processButtonA()

                return
            }
        }

        SoundEffectManager.play(.command)

        let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
        let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
        let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)

        // self.triangleIndex により
        // 何番目の冒険の書を指しているか
        var adventureLogNumber = 0

        if adventureLog1 != nil {
            if self.triangleIndex == 0 {
                adventureLogNumber = 1
            } else if self.triangleIndex == 1 {
                if adventureLog2 != nil {
                    adventureLogNumber = 2
                } else if adventureLog3 != nil {
                    adventureLogNumber = 3
                }
            } else if self.triangleIndex == 2 {
                adventureLogNumber = 3
            }
        } else if adventureLog2 != nil {
            if self.triangleIndex == 0 {
                adventureLogNumber = 2
            } else if self.triangleIndex == 1 {
                adventureLogNumber = 3
            }
        } else if adventureLog3 != nil {
            if self.triangleIndex == 0 {
                adventureLogNumber = 3
            }
        }

        if dqAdventureLogTop == .go {
            DataManager.scene.adventureLogScene?.setProcessing()
            DataManager.loadAdventureLog(number: adventureLogNumber)

            let dqSceneType = DataManager.adventureLog.dqSceneType

            DataManager.scene.transitionToMap(
                isFromAdventureLog: true,
                dqSceneTypeTo: dqSceneType,
                dqAudio: .none)
        } else if dqAdventureLogTop == .change_message_speed {
            self.adventureLogMessageSpeedWindowNode = AdventureLogMessageSpeedWindowNode(
                dqAdventureLogTop: dqAdventureLogTop,
                adventureLogNumber: adventureLogNumber)
            self.adventureLogMessageSpeedWindowNode?.addToWindow(windowNode: self)
        } else if dqAdventureLogTop == .copy {
            self.adventureLogSelectEmptyLogWindowNode = AdventureLogSelectEmptyLogWindowNode(
                dqAdventureLogTop: dqAdventureLogTop,
                adventureLogNumber: adventureLogNumber)
            self.adventureLogSelectEmptyLogWindowNode?.addToWindow(windowNode: self)
        } else if dqAdventureLogTop == .delete {
            self.adventureLogConfirmDeleteLogWindowNode = AdventureLogConfirmDeleteLogWindowNode()
            self.adventureLogConfirmDeleteLogWindowNode?.addToWindow(windowNode: self)

            self.adventureLogYesNoDeleteLogWindowNode = AdventureLogYesNoDeleteLogWindowNode(
                adventureLogNumber: adventureLogNumber)
            self.adventureLogYesNoDeleteLogWindowNode?.addToWindow(windowNode: self)
        }
    }
}

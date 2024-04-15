//
//  BaseSceneTransitionToMap.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

extension BaseScene {
    func transitionToMap(
        isFromAdventureLog: Bool,
        dqSceneTypeTo: DQSceneType,
        dqAudio: DQAudio
    ) {
        var shouldStopAudio = false

        if AudioManager.getDqAudio() != dqAudio {
            // 違う曲
            shouldStopAudio = true
        }

        let actionWait = SKAction.wait(forDuration: 0.5)

        let actionAudioStop = SKAction.run({
            if shouldStopAudio {
                AudioManager.stop()
            }
        })

        let actionFadeOut = SKAction.fadeAlpha(
            to: 1.0,
            duration: 0.5)

        let actionFadeIn = SKAction.fadeAlpha(
            to: 0.0,
            duration: 0.25)

        let sequence = SKAction.sequence([
            actionWait,
            actionAudioStop,
        ])
        Task {
            var shouldPlayAudio = false

            if AudioManager.getDqAudio() != dqAudio {
                // 違う曲
                shouldPlayAudio = true
            }

            await self.run(sequence)
            await self.blackScreenNode.run(actionFadeOut)

            if isFromAdventureLog {
                let adventureLogTopWindowNode = DataManager.scene.adventureLogScene?
                    .adventureLogTopWindowNode
                adventureLogTopWindowNode?.removeFromParent()

                DataManager.dqMainState = .adventure_log_loaded
            }

            setupDQScene(
                dqMainState: nil,
                dqSceneType: dqSceneTypeTo)

            await self.blackScreenNode.run(actionFadeIn)

            if shouldPlayAudio {
                AudioManager.play(dqAudio: dqAudio)
            }
        }
    }
}

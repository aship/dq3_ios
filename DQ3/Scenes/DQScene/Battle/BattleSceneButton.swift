//
//  BattleSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            if self.battleStatus == .start {
                self.messageWindowNode.isHidden = true
                
                self.commandWindowNode.isHidden = false
                self.statusWindowNode.isHidden = false
                self.targetWindowNode.isHidden = false
                
                self.battleStatus = .command
            }
            else if self.battleStatus == .command {
                self.scene.playSoundEffect(.command)
                
                self.commandWindowNode.isHidden = true
                self.targetWindowNode.isHidden = true
                
                self.messageWindowNode.isHidden = false
                
                let labelNode = self.labelNode
                labelNode.text = "えにくすは　イオナズンをとなえた！"
                labelNode.numberOfLines = 1
                
                self.scene.playSoundEffect(.spell)
                
                self.battleStatus = .combat
            }
            else if self.battleStatus == .combat {
                self.nodeSlime.isHidden = true
                self.nodeIkkaku.isHidden = true
                
                let labelNode = self.labelNode
                labelNode.text = "まもののむれを　やっつけた！"
                labelNode.numberOfLines = 1
                
                AudioManager.stop()
                self.scene.playSoundEffect(.win)
                
                self.battleStatus = .end
            }
            else if self.battleStatus == .end {
                self.battleStatus = .moveToField
                
                self.scene.transitionFromBattle(dqSceneType: .field,
                                                dqAudio: .field)
            }
        }
    }
}

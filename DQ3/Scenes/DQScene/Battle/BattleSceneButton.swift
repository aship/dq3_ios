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
                SoundEffectManager.play(.command)
                
                self.commandWindowNode.isHidden = true
                self.targetWindowNode.isHidden = true
                
                self.messageWindowNode.isHidden = false
                
                let labelNode = self.labelNode
                labelNode.text = "えにくすは　イオナズンをとなえた！"
                labelNode.numberOfLines = 1
                
                SoundEffectManager.play(.spell)
                
                self.battleStatus = .combat
            }
            else if self.battleStatus == .combat {
                self.nodeSlime.isHidden = true
                self.nodeIkkaku.isHidden = true
                
                let labelNode = self.labelNode
                labelNode.text = "まもののむれを　やっつけた！"
                labelNode.numberOfLines = 1
                
                AudioManager.stop()
                SoundEffectManager.play(.win)
                
                self.battleStatus = .end
            }
            else if self.battleStatus == .end {
                self.battleStatus = .moveToField
                
                if DataManager.dqSceneTypeFromBattle == .field {
                    var dqAudio: DQAudio = .field
                    
                    if self.scene.fieldMoveMode == .ship {
                        dqAudio = .ship
                    }
                    
                    self.scene.transitionFromBattle(dqSceneType: .field,
                                                    dqAudio: dqAudio)
                }
                else if DataManager.dqSceneTypeFromBattle == .alefgard {
                    self.scene.transitionFromBattle(dqSceneType: .alefgard,
                                                    dqAudio: .alefgard)
                }
            }
        }
    }
}

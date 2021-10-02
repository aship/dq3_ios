//
//  BattleScenePad.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func padOverlayVirtualStickInteractionDidStart(_ padNode: PadOverlay) {
    }
    
    func padOverlayVirtualStickInteractionDidChange(_ padNode: PadOverlay) {
    }
    
    func padOverlayVirtualStickInteractionDidEnd(_ padNode: PadOverlay) {
    }
    
    func willPress(_ button: ButtonOverlay) {
        if button == self.buttonA {
            if self.battleStatus == .start {
                self.messageWindowNode.isHidden = true
                
                self.commandWindowNode.isHidden = false
                self.nodeStatusWindow.isHidden = false
                self.nodeTargetWindow.isHidden = false
                
                self.battleStatus = .command
            }
            else if self.battleStatus == .command {
                SoundEffectManager.play(.command)
                
                self.commandWindowNode.isHidden = true
                self.nodeTargetWindow.isHidden = true
                
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
                
                self.battleStatus = .end
            }
            else if self.battleStatus == .end {
                self.battleStatus = .moveToField
                
                AudioManager.stop()
                
                SoundEffectManager.play(.win)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    let scene = FieldScene()
                    scene.heroPositionX = self.heroMapPositionX
                    scene.heroPositionY = self.heroMapPositionY
                    
                    let transition = SKTransition.crossFade(withDuration: 1.0)
                    
                    self.view?.presentScene(scene,
                                            transition: transition)
                }
            }
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}

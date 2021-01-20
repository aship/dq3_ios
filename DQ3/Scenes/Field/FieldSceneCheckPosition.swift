//
//  FieldSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension FieldScene {
    override func checkPosition(newPositionX: Int,
                                newPositionY: Int) {
        var enterAliahan = false
        
        if newPositionX == FieldAliahanPositionX &&
            newPositionY == FieldAliahanPositionY {
            enterAliahan = true
        }
        
        var enterBattle = false
        
        let battleRandomMax = 20
        let iValue = Int.random(in: 1 ... battleRandomMax)
        
        self.enterBattlePoint +=  iValue
        
        if 200 < self.enterBattlePoint &&
            iValue == battleRandomMax {
            enterBattle = true
        }
        
        let headNode = DataManager.characterNodes.first!
        
        if enterAliahan {
            headNode.setMoveProhibited()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                AudioManager.stop()
                self.playSoundEffect(.stairs)
                
                for node in DataManager.characterNodes {
                    node.removeFromParent()
                }
                
                headNode.positionX = AliahanTownEntrancePositionX
                headNode.positionY = AliahanTownEntrancePositionY
                
                let scene = AliahanTownScene()
                let transition = SKTransition.crossFade(withDuration: 1.0)
                
                self.view?.presentScene(scene,
                                        transition: transition)
            }
        }
        else if enterBattle {
            if DebugNoBattle {
                return
            }
            
            headNode.setMoveProhibited()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                AudioManager.stop()
                
                for node in DataManager.characterNodes {
                    node.removeFromParent()
                }
                
                let scene = BattleScene()
                let transition = SKTransition.crossFade(withDuration: 1.0)
                
                self.view?.presentScene(scene,
                                        transition: transition)
            }
        }
    }
}

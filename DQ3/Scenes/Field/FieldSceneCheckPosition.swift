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
        var enterBattle = false
        
        enterAliahan = checkEnterAliahan(newPositionX: newPositionX,
                                         newPositionY: newPositionY)
        enterBattle = checkEnterBattle()
        
        if enterAliahan {
            processEnterAliahan()
        }
        else if enterBattle {
            processenterBattle()
        }
    }
    
    private func checkEnterAliahan(newPositionX: Int,
                                   newPositionY: Int) -> Bool {
        if newPositionX == FieldAliahanPositionX &&
            newPositionY == FieldAliahanPositionY {
            return true
        }
        
        return false
    }
    
    private func checkEnterBattle() -> Bool {
        let battleRandomMax = 100
        let iValue = Int.random(in: 1 ... battleRandomMax)
        
        self.enterBattlePoint +=  iValue
        
        if 1000 < self.enterBattlePoint ||
            iValue == battleRandomMax {
            return true
        }
        
        return false
    }
    
    private func processEnterAliahan() {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        
        headNode.setMoveProhibited()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            AudioManager.stop()
            SoundEffectManager.play(.stairs)
            
            for node in DataManager.adventureLog.partyCharacterNodes {
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
    
    private func processenterBattle() {
        if DebugNoBattle {
            return
        }
        
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        
        headNode.setMoveProhibited()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            AudioManager.stop()
            
            for node in DataManager.adventureLog.partyCharacterNodes {
                node.removeFromParent()
            }
            
            let scene = BattleScene()
            let transition = SKTransition.crossFade(withDuration: 1.0)
            
            self.view?.presentScene(scene,
                                    transition: transition)
        }
    }
}

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
        setMoveProhibited()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            AudioManager.stop()
            SoundEffectManager.play(.stairs)
            
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
        
        setMoveProhibited()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            AudioManager.stop()
            
            let scene = BattleScene()
            scene.heroMapPositionX = self.heroPositionX
            scene.heroMapPositionY = self.heroPositionY
            
            let transition = SKTransition.crossFade(withDuration: 1.0)
            
            self.view?.presentScene(scene,
                                    transition: transition)
        }
    }
}

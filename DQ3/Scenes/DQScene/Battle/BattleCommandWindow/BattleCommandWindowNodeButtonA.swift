//
//  BattleCommandWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/05/19.
//

import SpriteKit

extension BattleCommandWindowNode {
    func processButtonA() {
        let battleScene = self.battleScene!
        let battleTargetWindowNode = battleScene.battleTargetWindowNode
        
        if battleTargetWindowNode.isOpen &&
            battleTargetWindowNode.isFocused {
            battleTargetWindowNode.processButtonA()
            
            return
        }
        
        let battleSpellWindowNode = self.battleSpellWindowNode
        
        if battleSpellWindowNode.isOpen {
       //     battleSpellWindowNode.presssButtonA()
            
            return
        }
        
        if self.dqBattleCommand == .fight {
            // たたかう
            processFight()
        }
        else if self.dqBattleCommand == .flee {
            // にげる
            processFlee()
        }
        else if self.dqBattleCommand == .defend {
            // ぼうぎょ
            processDefend()
        }
        else if self.dqBattleCommand == .items {
            // どうぐ
            processDefend()
        }
        else if self.dqBattleCommand == .spells {
            // じゅもん
            processSpell()
        }
    }
    
    private func processFight() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        let battleScene = self.battleScene
        battleScene?.battleTargetWindowNode.setFocused()
    }
    
    private func processDefend() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        var battleActionStruct = BattleActionStruct()
        battleActionStruct.battleActionType = .defend
        
        let battleScene = self.battleScene!
        battleScene.battleActionStructs.append(battleActionStruct)
        battleScene.nextBattleOrCommand()
    }
    
    private func processSpell() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        let battleScene = self.battleScene!
        self.battleSpellWindowNode = BattleSpellWindowNode(battleScene: battleScene)
        self.battleSpellWindowNode.addToWindow(windowNode: self)  
    }
}

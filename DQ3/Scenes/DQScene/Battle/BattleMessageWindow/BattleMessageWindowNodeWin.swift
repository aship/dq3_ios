//
//  BattleMessageWindowNodeWin.swift
//  DQ3
//
//  Created by aship on 2021/10/10.
//

import SpriteKit

extension BattleMessageWindowNode {
    func showWinMessage() async {
        AudioManager.stop()
        SoundEffectManager.play(.win)
        
        let text = "まものたちを やっつけた!"
        
        await showMessageFluently(
            string: text,
            line: 0)
        
        let actionWait = SKAction.wait(forDuration: 1)
        
        let scene = self.parent as! BaseScene
        
        await scene.run(actionWait)
        
        var dqAudio: DQAudio = .field
        
        if DataManager.dqSceneTypeFromBattle == .field {
            if scene.fieldMoveMode == .ship {
                dqAudio = .ship
            }
        }
        else {
            dqAudio = .alefgard
        }
        
        AudioManager.play(dqAudio: dqAudio)
        
        let textName = "えにくすは"
        await showMessageFluently(
            string: textName,
            line: 1)
        
        let battleScene = self.battleScene!
        let textExperience = "\(battleScene.exp)ポイントの けいけんちをかくとく!"
        await showMessageFluently(
            string: textExperience,
            line: 2)
        
        moveLine()
        
        let textGold = "\(battleScene.gold)ゴールドを てにいれた!"
        await showMessageFluently(
            string: textGold,
            line: 2)
        
        let partyCharacterStatuses = DataManager.adventureLog.partyCharacterStatuses
        
        for (index, partyCharacterStatus) in partyCharacterStatuses.enumerated() {
            partyCharacterStatus.exp += battleScene.exp
        }
        
        DataManager.adventureLog.partyCharacterStatuses = partyCharacterStatuses
        
        DataManager.adventureLog.gold += battleScene.gold
        
        self.battleGoldWindowNode = BattleGoldWindowNode()
        self.battleGoldWindowNode?.addToWindow(windowNode: self)
        
        // 1秒後にキー入力許可
        await scene.run(actionWait)
        
        self.battleGoldWindowNode?.isProcessing = false
    }
}

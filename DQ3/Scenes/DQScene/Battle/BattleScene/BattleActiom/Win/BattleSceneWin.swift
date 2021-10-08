//
//  BattleSceneWin.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

import SpriteKit

extension BattleScene {
    func winMonster() {
        self.battleMessageWindowNode.close()
        self.battleMessageWindowNode = BattleMessageWindowNode()
        
        let battleMessageWindowNode = self.battleMessageWindowNode
        let scene = self.scene!
        let scale = self.scene.scale
        
        battleMessageWindowNode.addToScene(
            scene: scene,
            scale: scale)
        
        // ここは、一度に表示ではなく、1文字づつ流れるように表示!!
        // let text = "スライムを やっつけた!"
        
        AudioManager.stop()
        SoundEffectManager.play(.win)
        
        let text = "まものたちを やっつけた!"
        
        battleMessageWindowNode.showMessageFluently(
            string: text,
            line: 0,
            completion: {})
    }
}

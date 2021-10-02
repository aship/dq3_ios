//
//  AdventureLogSelectEmptyLogWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/15.
//

import SpriteKit

extension AdventureLogSelectEmptyLogWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        if dqAdventureLogTop == .create {
            if let adventureLogInputNameWindowNode = self.adventureLogInputNameWindowNode {
                adventureLogInputNameWindowNode.processButtonA()
                
                return
            }
        }
        
        SoundEffectManager.play(.command)
        
        let dqAdventureLogTop = self.dqAdventureLogTop
        
        // 選択された空いてる冒険の書の番号
        var emptyAdventureLogNumber = 0
        
        let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
        let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
        let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)
        
        if self.triangleIndex == 0 {
            if adventureLog1 == nil {
                emptyAdventureLogNumber = 1
            }
            else if adventureLog2 == nil {
                emptyAdventureLogNumber = 2
            }
            else if adventureLog3 == nil {
                emptyAdventureLogNumber = 3
            }
        }
        else if self.triangleIndex == 1 {
            if adventureLog1 == nil {
                if adventureLog2 == nil {
                    emptyAdventureLogNumber = 2
                }
                else if adventureLog3 == nil {
                    emptyAdventureLogNumber = 3
                }
            }
            else if adventureLog2 == nil {
                emptyAdventureLogNumber = 3
            }
        }
        
        if dqAdventureLogTop == .create {
            self.adventureLogInputNameWindowNode = AdventureLogInputNameWindowNode(adventureLogNumber: emptyAdventureLogNumber)
            self.adventureLogInputNameWindowNode?.addToWindow(windowNode: self)
        }
        else if dqAdventureLogTop == .copy {
            // コピー元の冒険の書番号
            let copyFromAdventureLogNumber = self.adventureLogNumber!
            
            let adventureLog = UserDefaultsUtil.loadAdventureLog(number: copyFromAdventureLogNumber)!
            
            UserDefaultsUtil.saveAdventureLog(adventureLog: adventureLog,
                                              number: emptyAdventureLogNumber)
            reloadAdventureLogScene()
        }
    }
}

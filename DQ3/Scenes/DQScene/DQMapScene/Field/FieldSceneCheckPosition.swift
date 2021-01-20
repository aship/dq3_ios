//
//  FieldSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

extension FieldScene {
    func checkPosition(newPositionX: Int,
                       newPositionY: Int) {
        var enterAliahan = false
        
        if newPositionX == FieldAliahanPositionX &&
            newPositionY == FieldAliahanPositionY {
            enterAliahan = true
        }
        
        var enterBattle = false
        
        let battleRandomMax = 100
        let iValue = Int.random(in: 1 ... battleRandomMax)
        
        self.enterBattlePoint +=  iValue
        
        if 1000 < self.enterBattlePoint ||
            iValue == battleRandomMax
        {
            enterBattle = true
        }
        
        if enterAliahan {
            DataManager.queueFollowDirections = []
            
            for (index, node) in DataManager.characterNodes.enumerated() {
                node.positionX = AliahanTownEntrancePositionX - index
                node.positionY = AliahanTownEntrancePositionY
                node.direction = .right
                
                if 0 < index {
                    DataManager.queueFollowDirections.append(.right)
                }
            }
            
            self.scene.transitionToMapWithStairs(
                dqSceneType: .aliahan_town,
                dqAudio: .town)
        }
        else if enterBattle {
            if DebugNoBattle {
                return
            }
            
            let headNode = DataManager.characterNodes.first!
            headNode.setMoveProhibited()
            
            self.scene.transitionToBattle()
        }
    }
}

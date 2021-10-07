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
        
        enterAliahan = checkEnterAliahan(newPositionX: newPositionX,
                                         newPositionY: newPositionY)
        
        if enterAliahan {
            processEnterAliahan()
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
        DataManager.queueFollowDirections = []
        
        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            node.positionX = AliahanTownEntrancePositionX - index
            node.positionY = AliahanTownEntrancePositionY
            node.direction = .right
            
            if 0 < index {
                DataManager.queueFollowDirections.append(.right)
            }
        }
        
        self.scene.transitionToMapWithStairs(
            dqSceneTypeFrom: .field,
            dqSceneTypeTo: .aliahan_town,
            dqAudio: .town)
    }
}

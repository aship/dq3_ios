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
        var enterAlltradesAbbey = false
        var enterShip = false
        var enterBattle = false
        
        if self.scene.fieldMoveMode == .walk {
            enterAliahan = checkEnterAliahan(newPositionX: newPositionX,
                                             newPositionY: newPositionY)
            
            enterAlltradesAbbey = checkEnterAlltradesAbbey(newPositionX: newPositionX,
                                                           newPositionY: newPositionY)
            
            if DataManager.adventureLog.hasShip {
                enterShip = checkBoardingShip(newPositionX: newPositionX,
                                              newPositionY: newPositionY)
            }
        }
        
        if self.scene.fieldMoveMode != .ramia {
            enterBattle = checkEnterBattle()
        }
        
        if enterAliahan {
            processEnterAliahan()
        }
        else if enterAlltradesAbbey {
            processEnterAlltradesAbbey()
        }
        else if enterShip {
            processBoardingShip(tileMapNode: self.mainTileMapNode,
                                characterNodes: &DataManager.adventureLog.partyCharacterNodes,
                                shipNode: self.shipNode!,
                                queueFollowDirections: &DataManager.queueFollowDirections,
                                scale: self.scene.scale,
                                newPositionX: newPositionX,
                                newPositionY: newPositionY)
        }
        else if enterBattle {
            processEnterBattle()
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
    
    private func checkEnterAlltradesAbbey(newPositionX: Int,
                                          newPositionY: Int) -> Bool {
        if newPositionX == FieldAlltradesAbbeyPositionX &&
            newPositionY == FieldAlltradesAbbeyPositionY {
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
    
    private func processEnterAlltradesAbbey() {
        DataManager.queueFollowDirections = []
        
        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            node.positionX = AlltradesAbbeyEntrancePositionX
            node.positionY = AlltradesAbbeyEntrancePositionY - index
            node.direction = .up
            
            if 0 < index {
                DataManager.queueFollowDirections.append(.up)
            }
        }
        
        self.scene.transitionToMapWithStairs(
            dqSceneTypeFrom: .field,
            dqSceneTypeTo: .alltrades_abbey,
            dqAudio: .castle)
    }
    
    private func processEnterBattle() {
        if DebugNoBattle {
            return
        }
        
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        headNode.setMoveProhibited()
        
        let dqSceneType = DataManager.adventureLog.dqSceneType
        
        self.scene.transitionToBattle(dqSceneTypeFrom: dqSceneType)
    }
}

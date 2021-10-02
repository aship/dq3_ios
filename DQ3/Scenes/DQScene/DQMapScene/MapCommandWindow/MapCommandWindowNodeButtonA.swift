//
//  MapCommandWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/21.
//

import SpriteKit

extension MapCommandWindowNode {
    func processButtonA(adventureLog: AdventureLog) {
        if self.commandWindowStatus == .processing {
            return
        }
        
        if self.commandWindowStatus == .should_close {
            self.close()
            
            let partyCharacterNodes = adventureLog.partyCharacterNodes
            let characterNpcNodes = self.characterNpcNodes
            
            let headNode = partyCharacterNodes.first!
            headNode.setMovePermitted()
            
            for node in partyCharacterNodes {
                node.isPaused = false
            }
            
            for node in characterNpcNodes {
                node.isPaused = false
            }
            
            return
        }
        
        self.commandWindowStatus = .processing
        
        if self.commandType == .talk {
            let dqSceneType = adventureLog.dqSceneType
            processTalkButtonA(dqSceneType: dqSceneType)
        }
        else if self.commandType == .spells {
            processSpellButtonA()
        }
        else if self.commandType == .status {
            processStatusButtonA()
        }
        else if self.commandType == .items {
            processItemsButtonA()
        }
        else if self.commandType == .equip {
            processEquipButtonA()
        }
        else if self.commandType == .search {
            processSearchButtonA()
        }
    }
}

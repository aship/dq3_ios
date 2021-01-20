//
//  AliahanTownHouseSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownHouseScene {
    func checkPosition(newPositionX: Int,
                       newPositionY: Int) {
        var enterAliahanTown = false
        var enterMotherEscorting = false
        
        if newPositionX == AliahanTownHouseStairsPositionX &&
            newPositionY == AliahanTownHouseStairsPositionY {
            enterAliahanTown = true
        }
        else if DataManager.dqStory == .opening &&
                    newPositionX == AliahanTownHouseMotherCallPositionX {
            enterMotherEscorting = true
        }
        
        if enterAliahanTown {
            DataManager.showInsideMap = true
            DataManager.queueFollowDirections = []
            
            for node in DataManager.characterNodes {
                node.positionX = AliahanTownStairsToHousePositionX
                node.positionY = AliahanTownStairsToHousePositionY
                node.direction = .left
            }
            
            self.scene.transitionToMapWithStairs(
                dqSceneType: .aliahan_town,
                dqAudio: .town)
        }
        else if enterMotherEscorting {
            self.openingStateFlag = .mother_start_escorting
            
            let headNode = DataManager.characterNodes.first!
            headNode.setMoveProhibited()
            
            let text1 = "＊「さあ　かあさんに"
            let text2 = "　　ついて　いらっしゃい。"
            
            showMessages(text1: text1,
                         text2: text2,
                         text3: nil,
                         withSe: true,
                         withNextMark: false,
                         messageWindowNode: &self.messageWindowNode,
                         isMessageWindowOpen: &self.isMessageWindowOpen,
                         scale: self.scene.scale,
                         completion: {})
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.closeMessageWindow(messageWindowNode: self.messageWindowNode,
                                        isMessageWindowOpen: &self.isMessageWindowOpen)
                
                if newPositionY == 2 {
                    self.motherAndHeroMoveCatchUp2(completion: {
                        headNode.positionX += 2
                        
                        self.checkPosition(newPositionX: headNode.positionX,
                                           newPositionY: headNode.positionY)
                    })
                }
                else if newPositionY == 1 {
                    self.motherAndHeroMoveCatchUp1(completion: {
                        headNode.positionX += 2
                        headNode.positionY += 1
                        
                        self.checkPosition(newPositionX: headNode.positionX,
                                           newPositionY: headNode.positionY)
                    })
                }
            }
        }
    }
}

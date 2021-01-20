//
//  AliahanTownHouseSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownHouseScene {
    override func checkPosition(newPositionX: Int,
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
        
        let headNode = DataManager.characterNodes.first!
        
        if enterAliahanTown {
            headNode.setMoveProhibited()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.playSoundEffect(.stairs)
                
                headNode.positionX = AliahanTownStairsToHousePositionX
                headNode.positionY = AliahanTownStairsToHousePositionY
                
                for node in DataManager.characterNodes {
                    node.removeFromParent()
                }
                
                let scene = AliahanTownScene()
                DataManager.showInsideMap = true
               
                let transition = SKTransition.crossFade(withDuration: 1.0)
                
                self.view?.presentScene(scene,
                                        transition: transition)
            }
        }
        else if enterMotherEscorting {
            self.openingStateFlag = .mother_start_escorting
            
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
                         scale: self.scale,
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

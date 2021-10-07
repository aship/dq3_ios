//
//  AliahanTownHouseSceneButtonAOpening.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension AliahanTownHouseScene {
    func processButtonAOpening(mapMessageWindowNode: MapMessageWindowNode,
                               openingStateFlag: inout OpeningStateFlag) {
        if openingStateFlag == .message_one_start ||
            openingStateFlag == .message_two_start ||
            openingStateFlag == .message_three_start ||
            openingStateFlag == .mother_start_escorting {
            return
        }
        
        if openingStateFlag == .message_one_end {
            openingStateFlag = .message_two_start
            
            let text1 = "＊「きょうは　とても　たいせつなひ。"
            let text2 = "　　えにくすが　はじめて　おしろに"
            let text3 = "　　いくひ　だったでしょ。"
            
            self.mapMessageWindowNode.nextMark.removeFromParent()
            
            Task {
                await mapMessageWindowNode.showMessage(
                    string: text1,
                    line: 2,
                    withSe: true)
                
                await mapMessageWindowNode.showMessage(
                    string: text2,
                    line: 3,
                    withSe: true)
                
                await self.mapMessageWindowNode.moveLine()
                
                await mapMessageWindowNode.showMessage(
                    string: text3,
                    line: 3,
                    withSe: true)
                
                await self.mapMessageWindowNode.moveLine()
                await self.mapMessageWindowNode.showNextMark(line: 3)
                
                self.openingStateFlag = .message_two_end
            }
            
            return
        }
        
        if openingStateFlag == .message_two_end {
            openingStateFlag = .message_three_start
            
            let text1 = "＊「このひのために　おまえを"
            let text2 = "　　ゆうかんな　おとこのこ　として"
            let text3 = "　　そだてたつもりです。"
            
            self.mapMessageWindowNode.nextMark.removeFromParent()
            
            Task {
                await mapMessageWindowNode.showMessage(
                    string: text1,
                    line: 3,
                    withSe: true)
                
                await mapMessageWindowNode.moveLine()
                
                await mapMessageWindowNode.showMessage(
                    string: text2,
                    line: 3,
                    withSe: true)
                
                await mapMessageWindowNode.moveLine()
                
                await mapMessageWindowNode.showMessage(
                    string: text3,
                    line: 3,
                    withSe: true)
                
                await mapMessageWindowNode.moveLine()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.mapMessageWindowNode.close()
                    
                    self.motherMove(completion: {
                        self.openingStateFlag = .mother_moved
                        
                        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
                        headNode.setMovePermitted()
                    })
                }
            }
            
            return
        }
        
        if openingStateFlag == .mother_moved {
            processButtonA(mapCommandWindowNode: &mapCommandWindowNode,
                           mapMessageWindowNode: mapMessageWindowNode,
                           scale: self.scene.scale)
            return
        }
    }
}

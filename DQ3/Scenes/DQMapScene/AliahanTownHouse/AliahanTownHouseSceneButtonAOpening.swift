//
//  AliahanTownHouseSceneButtonAOpening.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension AliahanTownHouseScene {
    func processButtonAOpening(commandWindowNode: SKTileMapNode,
                               messageWindowNode: SKTileMapNode,
                               openingStateFlag: inout OpeningStateFlag) {
        if openingStateFlag == .message_one_start ||
            openingStateFlag == .mother_moving ||
            openingStateFlag == .mother_start_escorting {
            return
        }
        
        if openingStateFlag == .message_one_end {
            openingStateFlag = .message_two_start
            
            let text1 = "＊「きょうは　とても　たいせつなひ。"
            let text2 = "　　えにくすが　はじめて　おしろに"
            let text3 = "　　いくひ　だったでしょ。"
            
            showMessages(text1: text1,
                         text2: text2,
                         text3: text3,
                         withSe: true,
                         withNextMark: true,
                         messageWindowNode: &self.messageWindowNode,
                         isMessageWindowOpen: &self.isMessageWindowOpen,
                         scale: self.scene.scale,
                         completion: {
                            self.openingStateFlag = .message_two_end
                         })
        }
        else if openingStateFlag == .message_two_end {
            openingStateFlag = .message_three_start
            
            let text1 = "＊「このひのために　おまえを"
            let text2 = "　　ゆうかんな　おとこのこ　として"
            let text3 = "　　そだてたつもりです。"
            
            showMessages(text1: text1,
                         text2: text2,
                         text3: text3,
                         withSe: true,
                         withNextMark: false,
                         messageWindowNode: &self.messageWindowNode,
                         isMessageWindowOpen: &self.isMessageWindowOpen,
                         scale: self.scene.scale,
                         completion: {
                            self.openingStateFlag = .message_three_end
                         })
        }
        else if openingStateFlag == .message_three_end {
            openingStateFlag = .mother_moving
            
            closeMessageWindow(messageWindowNode: self.messageWindowNode,
                               isMessageWindowOpen: &self.isMessageWindowOpen)
            
            motherMove(completion: {
                self.openingStateFlag = .mother_moved
                
                let headNode = DataManager.characterNodes.first!
                headNode.setMovePermitted()
            })
        }
        else if openingStateFlag == .mother_moved {
            let headNode = DataManager.characterNodes.first!
            
            if self.isCommandWindowOpen &&
                self.isMessageWindowOpen {
                // 閉じる時
                headNode.setMovePermitted()
                
                for node in DataManager.characterNodes {
                    node.isPaused = false
                }
                
                for node in self.characterNpcNodes {
                    node.isPaused = false
                }
                
                closeCommandWindow(commandWindowNode: self.commandWindowNode,
                                   isCommandWindowOpen: &self.isCommandWindowOpen)
                closeMessageWindow(messageWindowNode: self.messageWindowNode,
                                   isMessageWindowOpen: &self.isMessageWindowOpen)
            }
            else if !self.isCommandWindowOpen {
                // コマンドウィンドウ表示
                self.scene.playSoundEffect(.command)
                headNode.setMoveProhibited()
                
                for node in DataManager.characterNodes {
                    node.isPaused = true
                }
                
                for node in self.characterNpcNodes {
                    node.isPaused = true
                }
                
                addCommandWindow(commandWindowNode: &self.commandWindowNode,
                                 isCommandWindowOpen: &self.isCommandWindowOpen,
                                 scale: self.scene.scale)
            }
            else {
                // 「はなす」でAボタンを押した
                self.scene.playSoundEffect(.command)
                
                self.scene.pauseTriangleAnimation(triangleNode: self.scene.triangleNode)
                
                let text1 = "そのほうこうには　だれも　いない。"
                
                showMessages(text1: text1,
                             text2: nil,
                             text3: nil,
                             withSe: false,
                             withNextMark: false,
                             messageWindowNode: &self.messageWindowNode,
                             isMessageWindowOpen: &self.isMessageWindowOpen,
                             scale: self.scene.scale,
                             completion: {})
            }
        }
    }
}

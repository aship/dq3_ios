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
                         scale: self.scale,
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
                         scale: self.scale,
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
                
                self.setMovePermitted()
            })
        }
        else if openingStateFlag == .mother_moved {
            if self.isCommandWindowOpen &&
                self.isMessageWindowOpen {
                // 閉じる時
                setMovePermitted()
                
                closeCommandWindow(commandWindowNode: self.commandWindowNode,
                                   isCommandWindowOpen: &self.isCommandWindowOpen)
                closeMessageWindow(messageWindowNode: self.messageWindowNode,
                                   isMessageWindowOpen: &self.isMessageWindowOpen)
            }
            else if !self.isCommandWindowOpen {
                // コマンドウィンドウ表示
                playSoundEffect(.command)
                setMoveProhibited()
                
                addCommandWindow(commandWindowNode: &self.commandWindowNode,
                                 isCommandWindowOpen: &self.isCommandWindowOpen,
                                 scale: self.scale)
            }
            else {
                // 「はなす」でAボタンを押した
                playSoundEffect(.command)
                
                pauseTriangleAnimation(triangleNode: self.triangleNode)
                
                let text1 = "そのほうこうには　だれも　いない。"
                
                showMessages(text1: text1,
                             text2: nil,
                             text3: nil,
                             withSe: false,
                             withNextMark: false,
                             messageWindowNode: &self.messageWindowNode,
                             isMessageWindowOpen: &self.isMessageWindowOpen,
                             scale: self.scale,
                             completion: {})
            }
        }
    }
}

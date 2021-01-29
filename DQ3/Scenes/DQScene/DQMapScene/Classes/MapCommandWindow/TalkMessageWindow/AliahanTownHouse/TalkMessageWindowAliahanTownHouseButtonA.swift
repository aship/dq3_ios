//
//  TalkMessageWindowAliahanTownHouseButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension TalkMessageWindowAliahanTownHouse {
    func processButtonA() {
        let headNode = DataManager.characterNodes.first!
        
        let values = processTalk(headNode: headNode)
        let withSe = values.0
        let withNextMark = values.1
        let closeWindow = values.2
        let text1 = values.3
        let text2 = values.4
        let text3 = values.5
        
        if self.motherMessageFlag == .message2 {
            processMotherMessage2(text1: text1,
                                 text2: text2!)
            return
        }
        
        showMessages(
            scene: self,
            text1: text1,
            text2: text2,
            text3: text3,
            withSe: withSe,
            withNextMark: withNextMark,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY,
            scale: 1,
            completion: {
                if closeWindow == true {
                    self.parentNode.commandWindowStatus = .should_close
                }
                else {
                    self.parentNode.commandWindowStatus = .open
                }
            })
    }
    
    #if false
    func processButtonA(commandWindowNode: SKTileMapNode,
                        messageWindowNode: SKTileMapNode) {
        let headNode = DataManager.characterNodes.first!
        
        if self.motherMessageFlag == .message_two {
            return
        }
        
        if self.motherMessageFlag == .message_two_finished {
            self.closeMessageWindow()
            
            headNode.setMovePermitted()
            
            self.motherMessageFlag = .no_message
            
            return
        }
        
        if self.motherMessageFlag == .message_one {
            self.motherMessageFlag = .message_two
            
            let text1 = "＊「さぞや　つかれたでしょう。"
            let text2 = "　　さあ　もう　おやすみ。"
            
            addMessageWindow(messageWindowNode: &self.messageWindowNode,
                             isMessageWindowOpen: &self.isMessageWindowOpen,
                             scale: self.scene.scale)
            
            showMessage(string: text1,
                        line: 0,
                        withSe: true,
                        messageWindowNode: self.messageWindowNode,
                        completion: {
                            self.showMessage(string: text2,
                                             line: 1,
                                             withSe: true,
                                             messageWindowNode: self.messageWindowNode,
                                             completion: {})
                        })
            
            let actionWait = SKAction.wait(forDuration: 1.0)
            
            let actionAudioStop = SKAction.run({
                AudioManager.stop()
            })
            
            let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                                   duration: 0.5)
            
            let actionHideWindows = SKAction.run({
                self.closeMessageWindow()
                self.closeCommandWindow(commandWindowNode: self.commandWindowNode,
                                        isCommandWindowOpen: &self.isCommandWindowOpen)
            })
            
            let actionAudioSe = SKAction.run({
                self.scene.playSoundEffect(.rest)
            })
            
            let actionFadeIn = SKAction.fadeAlpha(to: 0.0,
                                                  duration: 0.5)
            
            let sequence1 = SKAction.sequence([actionWait,
                                               actionAudioStop])
            
            let sequence2 = SKAction.sequence([actionFadeOut,
                                               actionAudioSe,
                                               actionHideWindows,
                                               actionWait,
                                               actionWait,
                                               actionWait,
                                               actionWait,
                                               actionFadeIn])
            
            self.scene.run(sequence1, completion: {
                self.scene.blackScreenNode.run(sequence2, completion: {
                    AudioManager.play(dqAudio: .town)
                    
                    let text1 = "＊「おはよう！"
                    let text2 = "　　あさですよ　あしぴーや。"
                    let text3 = "　　さあ　いってらっしゃい。"
                    
                    self.addMessageWindow(messageWindowNode: &self.messageWindowNode,
                                          isMessageWindowOpen: &self.isMessageWindowOpen,
                                          scale: self.scene.scale)
                    
                    self.showMessage(string: text1,
                                     line: 0,
                                     withSe: true,
                                     messageWindowNode: self.messageWindowNode,
                                     completion: {
                                        self.showMessage(string: text2,
                                                         line: 1,
                                                         withSe: true,
                                                         messageWindowNode: self.messageWindowNode,
                                                         completion: {
                                                            self.showMessage(string: text3,
                                                                             line: 2,
                                                                             withSe: true,
                                                                             messageWindowNode: self.messageWindowNode,
                                                                             completion: {})
                                                         })
                                     })
                    
                    self.motherMessageFlag = .message_two_finished
                })
            })
            
            return
        }
        
        if self.isCommandWindowOpen &&
            self.isMessageWindowOpen {
            // 閉じる時
            self.motherMessageFlag = .no_message
            
            headNode.setMovePermitted()
            
            for node in DataManager.characterNodes {
                node.isPaused = false
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = false
            }
            
            closeCommandWindow(commandWindowNode: self.commandWindowNode,
                               isCommandWindowOpen: &self.isCommandWindowOpen)
            closeMessageWindow()
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
                             isCommandWindowOpen: &self.isCommandWindowOpen)
        }
        else {
            // 「はなす」でAボタンを押した
            self.scene.playSoundEffect(.command)
            
            // このときに、direction + 1 のところにNPC がいるか判定
            // いるなら、そのNPC の会話を始める
            let values = checkCanTalk(positionX: headNode.positionX,
                                      positionY: headNode.positionY,
                                      direction: headNode.direction)
            
            let canTalk = values.0
            let name = values.1
            
            var withSe = false
            var text1 = "そのほうこうには　だれもいない。"
            var text2: String!
            var text3: String!
            
            if canTalk {
                withSe = true
                
                // head の方を向きたい
                for characterNpcNode in self.characterNpcNodes {
                    if characterNpcNode.name == name {
                        let direction = headNode.direction
                        let reverseDirection = getReverseDirection(direction: direction)
                        
                        characterNpcNode.setTexture(direction: reverseDirection)
                        characterNpcNode.changeDirection(direction: reverseDirection)
                    }
                }
                
                if name == "mother" {
                    self.motherMessageFlag = .message_one
                    
                    text1 = "＊「おかえりなさい"
                    text2 = "　　わたしのかわいい　えにくすや。"
                }
                else if name == "grandfather" {
                    text1 = "＊「おまえの　ちちオルテガは"
                    text2 = "　　りっぱな　ゆうしゃじゃった。"
                    text3 = "　　このじいの　むすこじゃ！"
                }
            }
            
            addMessageWindow(messageWindowNode: &self.messageWindowNode,
                             isMessageWindowOpen: &self.isMessageWindowOpen,
                             scale: self.scene.scale)
            
            showMessage(string: text1,
                        line: 0,
                        withSe: withSe,
                        messageWindowNode: self.messageWindowNode,
                        completion: {
                            if text2 != nil {
                                self.showMessage(string: text2,
                                                 line: 1,
                                                 withSe: true,
                                                 messageWindowNode: self.messageWindowNode,
                                                 completion: {
                                                    if text3 != nil {
                                                        self.showMessage(string: text3,
                                                                         line: 2,
                                                                         withSe: true,
                                                                         messageWindowNode: self.messageWindowNode,
                                                                         completion: {})
                                                    }
                                                 })
                            }
                        })
        }
    }
    #endif
}

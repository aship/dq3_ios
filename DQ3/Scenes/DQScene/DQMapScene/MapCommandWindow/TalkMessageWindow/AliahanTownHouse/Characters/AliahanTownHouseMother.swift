//
//  AliahanTownHouseMother.swift
//  DQ3
//
//  Created by aship on 2021/04/22.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTownHouse {
    func processMotherButtonA() {
        if self.motherMessageFlag == .none {
            self.motherMessageFlag = .message1
            
            let text1 = "＊「おかえりなさい"
            let text2 = "　　わたしのかわいい　えにくすや。"
            
            showMessages(
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: true,
                completion: {
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .prompt
                })
        }
        else if self.motherMessageFlag == .message1 {
            self.motherMessageFlag = .message2
            
            let text1 = "＊「さぞや　つかれたでしょう。"
            let text2 = "　　さあ　もう　おやすみ。"
            
            self.nextMark.removeFromParent()
            
            Task {
                await showMessage(string: text1,
                                  line: 2,
                                  withSe: true)
                
                await showMessage(string: text2,
                                  line: 3,
                                  withSe: true)
                
                self.moveLine()
                self.sleepInHouse()
            }
        }
    }
    
    private func sleepInHouse() {
        let actionWait = SKAction.wait(forDuration: 1.0)
        
        let actionAudioStop = SKAction.run({
            AudioManager.stop()
        })
        
        let actionFadeOut = SKAction.fadeAlpha(to: 1.0,
                                               duration: 0.5)
        
        let actionHideWindows = SKAction.run({
            // 字を全部消す
            for line in self.arrLines {
                for letter in line {
                    letter.removeFromParent()
                }
            }
            
            self.arrLines = []
        })
        
        let actionAudioSe = SKAction.run({
            SoundEffectManager.play(.rest)
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
        let scene = DataManager.scene
        
        scene.run(sequence1, completion: {
            scene.blackScreenNode.run(sequence2, completion: {
                AudioManager.play(dqAudio: .town)
                
                let text1 = "＊「おはよう！"
                let text2 = "　　あさですよ　あしぴーや。"
                let text3 = "　　さあ　いってらっしゃい。"
                
                Task {
                    await self.showMessage(string: text1,
                                           line: 0,
                                           withSe: true)
                    
                    await self.showMessage(string: text2,
                                           line: 1,
                                           withSe: true)
                    
                    await self.showMessage(string: text3,
                                           line: 2,
                                           withSe: true)
                    
                    self.motherMessageFlag = .none
                    
                    let parent = self.parent as! MapCommandWindowNode
                    parent.commandWindowStatus = .should_close
                }
            })
        })
    }
}

//
//  TalkMessageWindowAliahanTownHouseNpc.swift
//  DQ3
//
//  Created by aship on 2021/01/29.
//

import SpriteKit

extension TalkMessageWindowAliahanTownHouse {
    func processMotherMessage2(text1: String,
                               text2: String) {
        // 最後の ▼ を消す
        self.nextMark.removeFromParent()
        
        showMessage(string: text1,
                    line: 2,
                    withSe: true,
                    completion: {
                        self.showMessage(string: text2,
                                         line: 3,
                                         withSe: true,
                                         completion: {
                                            self.moveLine()
                                            
                                            
                                            
                                            self.sleepInHouse()
                                            
                                      //      self.parentNode.commandWindowStatus = .should_close
                                       //     self.lady1MessageFlag = .none
                                         })
                    })
    }
    
    func sleepInHouse() {
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
                
                self.showMessage(string: text1,
                                 line: 0,
                                 withSe: true,
                                 completion: {
                                    self.showMessage(string: text2,
                                                     line: 1,
                                                     withSe: true,
                                                     completion: {
                                                        self.showMessage(string: text3,
                                                                         line: 2,
                                                                         withSe: true,
                                                                         completion: {
                                                                            self.parentNode.commandWindowStatus = .should_close
                                                                            self.motherMessageFlag = .none
                                                                         })
                                                     })
                                 })
            })
        })
    }
}

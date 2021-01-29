//
//  TalkMessageWindowAliahanTownNpc.swift
//  DQ3
//
//  Created by aship on 2021/01/29.
//

import SpriteKit

extension TalkMessageWindowAliahanTown {
    func processLady1Message2(text1: String,
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
                                            
                                            self.parentNode.commandWindowStatus = .should_close
                                            self.lady1MessageFlag = .none
                                         })
                    })
    }
    
    func processOldMan1Message2(text1: String,
                                text2: String) {
        // 最後の ▼ を消す
        self.nextMark.removeFromParent()
        
        showMessage(string: text1,
                    line: 3,
                    withSe: true,
                    completion: {
                        self.moveLine()
                        
                        self.showMessage(string: text2,
                                         line: 3,
                                         withSe: true,
                                         completion: {
                                            self.moveLine()
                                            
                                            self.showNextMark(line: 3)
                                            
                                            self.parentNode.commandWindowStatus = .open
                                         })
                    })
    }
    
    func processOldMan1Message3(text1: String,
                                text2: String,
                                text3: String) {
        // 最後の ▼ を消す
        self.nextMark.removeFromParent()
        
        showMessage(string: text1,
                    line: 3,
                    withSe: true,
                    completion: {
                        self.moveLine()
                        
                        self.showMessage(string: text2,
                                         line: 3,
                                         withSe: true,
                                         completion: {
                                            self.moveLine()
                                            
                                            self.showMessage(string: text3,
                                                             line: 3,
                                                             withSe: true,
                                                             completion: {
                                                                self.moveLine()
                                                                
                                                                self.parentNode.commandWindowStatus = .should_close
                                                                self.oldMan1MessageFlag = .none
                                                             })
                                         })
                    })
    }
}

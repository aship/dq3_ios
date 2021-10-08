//
//  AliahanTownTalkMessageYesNoWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/21.
//

import SpriteKit

class AliahanTownTalkMessageYesNoWindowNode: BaseYesNoWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        SoundEffectManager.play(.command)
        
        if self.name == "old_man2" {
            Task {
                var text1: String!
                var text2: String!
                
                if self.dqYesNo == .yes {
                    text1 = "＊「あの　しまに　そびえるのが"
                    text2 = "　　ナジミのとう　じゃ。"
                }
                else if self.dqYesNo == .no {
                    text1 = "＊「そとにでれば"
                    text2 = "　　すぐに　みられるはずじゃ。"
                }
                
                let parent = self.parent as! TalkMessageWindowNodeAliahanTown
                
                
                await parent.showMessage(string: text1,
                                         line: 3,
                                         withSe: true)
                parent.moveLine()
                
                await parent.showMessage(string: text2,
                                         line: 3,
                                         withSe: true)
                parent.moveLine()
                
                let parentParent = parent.parent as! MapCommandWindowNode
                parentParent.commandWindowStatus = .should_close
            }
        }
    }
}

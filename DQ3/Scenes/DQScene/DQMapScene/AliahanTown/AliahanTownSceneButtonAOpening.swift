//
//  AliahanTownSceneButtonAOpening.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension AliahanTownScene {
    func processButtonAOpening(mapCommandWindowNode: MapCommandWindowNode,
                               mapMessageWindowNode: MapMessageWindowNode,
                               openingStateFlag: inout OpeningStateFlag) {
        if openingStateFlag == .mother_moving ||
            openingStateFlag == .message_one_start ||
            openingStateFlag == .message_two_start ||
            openingStateFlag == .finished {
            return
        }
        
        if openingStateFlag == .message_one_end {
            openingStateFlag = .message_two_start
            
            let text1 = "＊「おうさまに　ちゃんと"
            let text2 = "　　あいさつ　するのですよ。"
            let text3 = "　　さあ　いってらっしゃい。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: self.scene,
                text1: text1,
                text2: text2,
                text3: text3,
                withSe: true,
                withNextMark: false,
                pointX: MapMessageWindowChildOfScenePointX,
                pointY: MapMessageWindowChildOfScenePointY,
                scale: self.scene.scale,
                completion: {
                    self.openingStateFlag = .message_two_end
                })
        }
        else if openingStateFlag == .message_two_end {
            let headNode = DataManager.characterNodes.first!
            
            headNode.setMovePermitted()
            
            self.mapMessageWindowNode.close()
            
            openingStateFlag = .finished
            DataManager.dqStory = .mother_waiting
        }
    }
}

//
//  AliahanTownHouseSceneTalk.swift
//  DQ3
//
//  Created by aship on 2021/01/19.
//

import SpriteKit

extension TalkMessageWindowAliahanTownHouse {
    func processTalk(headNode: CharacterNode) -> (Bool, Bool, Bool, String, String?, String?) {
        // 「はなす」でAボタンを押した
        SoundEffectManager.play(.command)
        
        // このときに、direction + 1 のところにNPC がいるか判定
        // いるなら、そのNPC の会話を始める
        let values = checkCanTalk(positionX: headNode.positionX,
                                  positionY: headNode.positionY,
                                  direction: headNode.direction)
        let canTalk = values.0
        let name = values.1
        
        var withSe = false
        var withNextMark = false
        var closeWindow = true
        var text1 = "そのほうこうには　だれも　いない。"
        var text2: String!
        var text3: String!
        
        if canTalk {
            withSe = true
            
            // head の方を向きたい
            for characterNpcNode in self.characterNpcNodes {
                if characterNpcNode.name == name {
                    if characterNpcNode.dqCharacter == .none {
                        continue
                    }
                    
                    let direction = headNode.direction
                    let reverseDirection = getReverseDirection(direction: direction)
                    
                    characterNpcNode.setTexture(direction: reverseDirection)
                    characterNpcNode.changeDirection(direction: reverseDirection)
                }
            }
            
            if name == "mother" {
                if self.motherMessageFlag == .none {
                    self.motherMessageFlag = .message1
                    
                    text1 = "＊「おかえりなさい"
                    text2 = "　　わたしのかわいい　えにくすや。"
                    withNextMark = true
                    closeWindow = false
                }
                else if self.motherMessageFlag == .message1 {
                    self.motherMessageFlag = .message2
                    
                    text1 = "＊「さぞや　つかれたでしょう。"
                    text2 = "　　さあ　もう　おやすみ。"
                    withNextMark = false
                    closeWindow = false
                }
            }
            else if name == "grandfather" {
                text1 = "＊「おまえの　ちちオルテガは"
                text2 = "　　りっぱな　ゆうしゃじゃった。"
                text3 = "　　このじいの　むすこじゃ！"
            }
        }
        
        return (withSe, withNextMark, closeWindow, text1, text2, text3)
    }
}

//
//  AliahanTownSceneTalk.swift
//  DQ3
//
//  Created by aship on 2021/01/17.
//

import SpriteKit

extension TalkMessageWindowAliahanTown {
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
                text1 = "＊「えにくすや　どうしたの？"
                text2 = "　　おうさまに　あっていらっしゃい。"
            }
            else if name == "lady1" {
                if self.lady1MessageFlag == .none {
                    self.lady1MessageFlag = .message1
                    
                    text1 = "＊「ここは　アリアハンの"
                    text2 = "　　じょうかまち。"
                    withNextMark = true
                    closeWindow = false
                }
                else if self.lady1MessageFlag == .message1 {
                    self.lady1MessageFlag = .message2
                    
                    text1 = "＊「きたにいくと　レーベのむら"
                    text2 = "　　ありますわ。"
                }
            }
            else if name == "lady2" {
                text1 = "＊「まちのなかにいると"
                text2 = "　　まおうが　せかいをほろぞすなど"
                text3 = "　　まるで　うそのようですわ。"
            }
            else if name == "boy1" {
                text1 = "＊「おしろから　うみづたいを"
                text2 = "　　あること　みさきの　どうくつが"
                text3 = "　　あるそうです。"
            }
            else if name == "boy2" {
                text1 = "＊「まちのそとに　でで"
                text2 = "　　ながくあるけば　やがて　よるに"
                text3 = "　　なります。"
            }
            else if name == "old_man1" {
                if self.oldMan1MessageFlag == .none {
                    self.oldMan1MessageFlag = .message1
                    
                    text1 = "＊「かつて　アリアハンは"
                    text2 = "　　すべてのせかいを　おさめていた"
                    text3 = "　　のじゃ。"
                    
                    withNextMark = true
                    closeWindow = false
                }
                else if self.oldMan1MessageFlag == .message1 {
                    self.oldMan1MessageFlag = .message2
                    
                    text1 = "＊「しかし　せんそうがおこって"
                    text2 = "　　おおくの　ひとびとが　しんだ。"
                }
                else if self.oldMan1MessageFlag == .message2 {
                    self.oldMan1MessageFlag = .message3
                    
                    text1 = "＊「そして　うみのむこうにつうじる"
                    text2 = "　　たびのとびらを"
                    text3 = "　　ふうじこめたのじゃ。"
                }
            }
            else if name == "old_man2" {
                if self.oldMan2MessageFlag == .none {
                    self.oldMan2MessageFlag = .message1
                    text1 = "＊「このしろの　にしに"
                    text2 = "　　うかぶ　しまを"
                    text3 = "　　もう　みなさったか？"
                }
                
                
                
            }
            else if name == "warrior1" {
                text1 = "＊「つれてゆくなら"
                text2 = "　　せんし　そうりょ　まほうつかいの"
                text3 = "　　３にんが　いいぜ。ひっく。"
            }
            else if name == "warrior2" {
                text1 = "＊「あなたが　あの　ゆうかんだった"
                text2 = "　　オルテガの　むすこさんか？"
                text3 = "　　おちちうえは　りっぱでしたぞ！"
            }
            else if name == "warrior3" {
                text1 = "＊「アリアハンは　うみに"
                text2 = "　　かこまれた　たいりく　なのだ。"
                
                //                    text = "＊「しかし　うみのむこうんは\n　もっと　おおきな\n　たいりくがあるというぞ。"
                //                    numberOfLine = 3
            }
            else if name == "depository_talk" {
                text1 = "＊「ここは　あずかりじょです。"
                
                
                //                    text = "＊「どんな　ごようでしょう？"
                //                    numberOfLine = 1
            }
            else if name == "tool_shop_talk" {
                text1 = "＊「ここはどうぐやです。"
                text2 = "　　どんな　ごようでしょう？"
            }
            else if name == "inn_talk" {
                text1 = "＊「こんにちは"
                text2 = "　　たびびとの　やどに　ようこそ。"
                
                //                    text = "＊「ひとばん　２ゴールドですが\n　おとまりに　なりますか？"
                //                    numberOfLine = 2
            }
            else if name == "weapon_shop_talk" {
                text1 = "＊「ここは　ぶきと　ぼうぐのみせだ。"
                text2 = "　　うってるものを　みるかね？"
            }
            else if name == "priest" {
                text1 = "＊「たのもしき　カミの　しもべよ"
                text2 = "　　わが　きょうかいに　どんな"
                text3 = "　　ごようじゃな？"
            }
            else if name == "luida_talk" {
                text1 = "＊「ここはルイーダのみせ。"
                text2 = "　　なかまをくわえますね。"
                
                // 暫定処理
                addParties()
            }
        }
        
        return (withSe, withNextMark, closeWindow, text1, text2, text3)
    }
}

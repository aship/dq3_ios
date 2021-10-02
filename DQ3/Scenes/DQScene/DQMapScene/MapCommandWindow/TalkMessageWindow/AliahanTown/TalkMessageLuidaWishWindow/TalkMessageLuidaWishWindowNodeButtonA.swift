//
//  TalkMessageLuidaWishWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/05/07.
//

import SpriteKit

extension TalkMessageLuidaWishWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        //     if self.name == "old_man2" {
        var text1: String!
        var text2: String!
        
        if self.dqLuidaWish == .add_member {
            if DataManager.adventureLog.partyCharacterStatuses.count == 4 {
                
                
                //   if member.count == 4
                text1 = "*「あら そんなに ぞろぞろ"
                text2 = "  おなかまが いるのに?"
                
                // *「だれかと わかれないかぎり
                // あたらしいなかまは
                // くわえられないわ
                
                //  *「ほかにごようは?  -> YES/NO
                
                // YES -> *「なにを おのぞみかしら?
                // NO -> *「じゃ またいらしてね。 ->  END
                // }
            }
            else {
                text1 = "*「じゃあ ねんのため いまの"
                text2 = " じょうたいを ぼうけんのしょに"
                //  text3 = "きろくするわね?"  -> YES/NO
                
                // *「だれを なかまに くわえるの?
            }
        }
        else if self.dqLuidaWish == .add_member {
            text1 = "*「じゃあ ねんのため いまの"
            text2 = " じょうたいを ぼうけんのしょに"
            //  text3 = "きろくするわね?"  -> YES/NO
            // YES -> *「だれと わかれるの?
            // -> メンバー選択
            // *「あああと わかれるのね? > YES/NO
            // YES
            // *「あらいやだ。
            // じぶんとは わかれられないわよ。
            // *「ほかにごようは?
            
            // *「ああああさん
            //  しばらく おやすみだわよ。
            // ＊＊＊＊たちは
            // ええええと わかれた
            // *「ほかにごようは?
            
            // NO *「あら やめるの?
            // それがいいかも しれないわね。
            
            
            
            // B -> *「あら やめるの?
            // それがいいかも しれないわね。
            // -> *「ほかにごようは? -> YES/NO
            
            
            
            // NO -> *「だったら わるいけどできないわ。
            // きろくしてもいい じょうたいに
            // してから また いらしてね。
        }
        else if self.dqLuidaWish == .see_list {
            text1 = "*「あら めいぼには だれも"
            text2 = "  とうろくされては いないわよ。"
            
            // *「2かいの とうろくじょで
            // なかまに したいひとを
            // とうろくしてから またきてね。
            
            // -> *「ほかにごようは?
            
        }
        
        let parent = self.parent as! TalkMessageWindowNodeAliahanTown
        
        parent.showMessage(string: text1,
                           line: 3,
                           withSe: true,
                           completion: {
                            parent.moveLine()
                            parent.showMessage(string: text2,
                                               line: 3,
                                               withSe: true,
                                               completion: {
                                                parent.moveLine()
                                                
                                                let parentParent = parent.parent as! MapCommandWindowNode
                                                parentParent.commandWindowStatus = .should_close
                                               })
                           })
        //   }
    }
    
    
    
    func addParties() {
//        if DataManager.characterNodes.count == 4 {
//            return
//        }
//        
//        DataManager.characterNodes.append(CharacterNode(dqCharacter: .warrior_female))
//        DataManager.characterNodes.append(CharacterNode(dqCharacter: .priest_female))
//        DataManager.characterNodes.append(CharacterNode(dqCharacter: .mage_female))
//        
//        DataManager.queueFollowDirections = [.left, .left, .left]
//        
//        // パーティメンバー
//        for (index, node) in DataManager.characterNodes.enumerated() {
//            if index == 0 {
//                // Head はスルー
//                continue
//            }
//            
//            if index == 1 {
//                node.positionX = 3
//                node.positionY = 32
//            }
//            else if index == 2 {
//                node.positionX = 4
//                node.positionY = 32
//            }
//            else if index == 3 {
//                node.positionX = 5
//                node.positionY = 32
//            }
//            
//            node.addToMap(tileMapNode: self.mainTileMapNode,
//                          isTown: true)
//            
//            node.initDirection(direction: .left)
//            node.setPosition(tileMapNode: self.mainTileMapNode,
//                             isHead: false,
//                             scale: self.scene.scale)
//            
//            node.zPosition = ZPositionPartyHead - CGFloat(index)
//        }
    }
}

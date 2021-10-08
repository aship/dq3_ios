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
        
        Task {
            var text1: String!
            var text2: String!
            
            if self.dqLuidaWish == .add_member {
                if 1 < DataManager.adventureLog.partyCharacterNodes.count {
                    
                    
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
                    confirmAddParties()
                    return
                    
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
    
    func confirmAddParties() {
        let text1 = "*「じゃあ ねんのため いまの"
        let text2 = " じょうたいを ぼうけんのしょに"
        let text3 = "きろくするわね?" // -> YES/NO
        
        // *「だれを なかまに くわえるの?
        
        
        let parent = self.parent as! TalkMessageWindowNodeAliahanTown
        
        Task {
            await parent.showMessage(string: text1,
                                     line: 3,
                                     withSe: true)
            parent.moveLine()
            
            await parent.showMessage(string: text2,
                                     line: 3,
                                     withSe: true)
            parent.moveLine()
            
            await parent.showMessage(string: text3,
                                     line: 3,
                                     withSe: true)
            parent.moveLine()
            
            addParties()
            
            let parentParent = parent.parent as! MapCommandWindowNode
            parentParent.commandWindowStatus = .should_close
        }
    }
    
    func addParties() {
        if DataManager.adventureLog.partyCharacterNodes.count == 4 {
            return
        }
        
        DataManager.adventureLog.partyCharacterNodes.append(CharacterNode(dqCharacter: .warrior_female))
        DataManager.adventureLog.partyCharacterNodes.append(CharacterNode(dqCharacter: .priest_female))
        DataManager.adventureLog.partyCharacterNodes.append(CharacterNode(dqCharacter: .mage_female))
        
        DataManager.queueFollowDirections = [.left, .left, .left]
        
        // パーティメンバー
        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            if index == 0 {
                // Head はスルー
                continue
            }
            
            if index == 1 {
                node.positionX = 3
                node.positionY = 32
            }
            else if index == 2 {
                node.positionX = 4
                node.positionY = 32
            }
            else if index == 3 {
                node.positionX = 5
                node.positionY = 32
            }
            
            let aliahanTownScene = DataManager.aliahanTownScene!
            
            node.addToMap(tileMapNode: aliahanTownScene.mainTileMapNode,
                          isTown: true)
            
            node.initDirection(direction: .left)
            node.setPosition(tileMapNode: aliahanTownScene.mainTileMapNode,
                             withMoveMap: false,
                             scale: aliahanTownScene.scene.scale)
            
            node.zPosition = ZPositionPartyHead - CGFloat(index)
        }
    }
}

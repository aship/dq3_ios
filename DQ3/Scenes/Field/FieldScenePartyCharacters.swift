//
//  FieldScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension FieldScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            scale: CGFloat) {
        var isHead: Bool!
        
        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {            
            node.addToMap(tileMapNode: tileMapNode,
                          isTown: false)
            
            node.initDirection(direction: .down)
            
            if index == 0 {
                isHead = true
                
                // 前 Scene でキー入れっぱなしの時に
                // 前 Scene の update -> setMove 処理が残ってて
                // Scene 切り替え直後に1歩動いてしまうため必要
                // 一度 setMoveProhibitted してるのに
                // なぜか isMovePermitted = true になる解
                // scene 切り替わってるのに前 Scene の update が走るのが原因か
                // 起きたり起きなかったり条件不明、iOSのバグっぽい、直ってたら外す
                // 後 Scene の setMovePermitted　が早すぎるのが問題っぽいので遅らせる暫定対応
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    node.setMovePermitted()
                }
            }
            else {
                isHead = false
            }
            
            node.setPosition(tileMapNode: tileMapNode,
                             withMoveMap: isHead,
                             scale: self.scale)
            
            node.zPosition = CGFloat(4 - index)
        }
    }
}

//
//  AliahanTownHouseScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            dqStory: DQStory,
                            scale: CGFloat) {
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        headNode.addToMap(tileMapNode: tileMapNode,
                          isTown: true)
        // 前 Scene でキー入れっぱなしの時に
        // 前 Scene の update -> setMove 処理が残ってて
        // Scene 切り替え直後に1歩動いてしまうため必要
        // 一度 setMoveProhibitted してるのに
        // なぜか isMovePermitted = true になる解
        // scene 切り替わってるのに前 Scene の update が走るのが原因か
        // 起きたり起きなかったり条件不明、iOSのバグっぽい、直ってたら外す
        // 後 Scene の setMovePermitted　が早すぎるのが問題っぽいので遅らせる暫定対応
        if DataManager.dqStory != .opening {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                headNode.setMovePermitted()
            }
        }
        
        if DataManager.dqStory == .opening {
            headNode.positionX = AliahanTownHouseMotherPositionX
            headNode.positionY = AliahanTownHouseMotherPositionY - 1
            
            headNode.texture = SKTexture(imageNamed: "character/vocation/hero/sleep")
        }
        else {
            headNode.positionX = AliahanTownHouseStairsPositionX
            headNode.positionY = AliahanTownHouseStairsPositionY
            
            headNode.initDirection(direction: .right)
        }
        
        headNode.zPosition = 4
        headNode.setPosition(tileMapNode: tileMapNode,
                             withMoveMap: true,
                             scale: scale)
    }
}

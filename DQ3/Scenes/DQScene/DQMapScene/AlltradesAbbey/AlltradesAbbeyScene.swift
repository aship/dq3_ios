//
//  AlltradesAbbeyScene.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

class AlltradesAbbeyScene: DQMapScene {
    func setup() {
        AudioManager.play(dqAudio: .castle)
        
        self.scene.backgroundColor =  UIColor.gray
        self.addMainTileMap(name: "alltrades_abbey",
                            tileMapNode: &self.mainTileMapNode,
                            numberOfImages: 31,
                            scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           isTown: true,
                           scale: self.scene.scale)
        
        addNpcCharacters(tileMapNode: self.mainTileMapNode,
                         characterNpcNodes: &self.characterNpcNodes,
                         scale: self.scene.scale)
        
        // ロード直後
        if DataManager.launchAdventureLog {
            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()
            
            let text1 = "*「よくぞ もどった!"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.addToNode(
                node: scene,
                pointX: MapMessageWindowChildOfScenePointX,
                pointY: MapMessageWindowChildOfScenePointY,
                scale: self.scene.scale)
            
            self.mapMessageWindowNode.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: true,
                withNextMark: true,
                completion: {
                    headNode.setMovePermitted()
                })
        }
    }
}

//
//  AliahanTownScene.swift
//  DQ3
//
//  Created by aship on 2020/12/09.
//

import SpriteKit

class AliahanTownScene: DQMapScene {
    enum OpeningStateFlag {
        case none
        case mother_moving
        case mother_moved
        case message_one_start
        case message_one_end
        case message_two_start
        case message_two_end
        case finished
    }
    
    var openingStateFlag: OpeningStateFlag = .none
    
    let greenBGColor = UIColor(red: 166 / 255,
                               green: 226 / 255,
                               blue: 70 / 255,
                               alpha: 1)
    func setup() {
        AudioManager.play(dqAudio: .town)
        
        self.scene.backgroundColor = UIColor(red: 166 / 255,
                                             green: 226 / 255,
                                             blue: 70 / 255,
                                             alpha: 1)
        
        self.addMainTileMap(name: "aliahan_town",
                            tileMapNode: &self.mainTileMapNode,
                            numberOfImages: 20,
                            scale: self.scene.scale)
        
        self.addInsideTileMap(name: "aliahan_town_inside",
                              mainTileMapNode: self.mainTileMapNode,
                              insideTileMapNode: &self.insideTileMapNode,
                              numberOfImages: 12)
        
        if DataManager.showInsideMap {
            self.showInsideTileMap(insideTileMapNode: self.insideTileMapNode)
            
            DataManager.showInsideMap = false
        }
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           isTown: true,
                           scale: self.scene.scale)
        
        let dqStory = DataManager.adventureLog.dqStory
        
        addNpcCharacters(mainTileMapNode: self.mainTileMapNode,
                         insideTileMapNode: self.insideTileMapNode,
                         characterNpcNodes: &self.characterNpcNodes,
                         scale: self.scene.scale,
                         dqStory: dqStory)
        
        let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes
        
        setNpcMove(characterNodes: partyCharacterNodes,
                   characterNpcNodes: self.characterNpcNodes,
                   tileMapNode: self.mainTileMapNode,
                   scale: self.scene.scale,
                   dqStory: dqStory)
        
        if dqStory == .opening {
            let headNode = partyCharacterNodes.first!
            headNode.setMoveProhibited()
            headNode.initDirection(direction: .left)
            
            self.motherAndHeroMove(completion: {
                self.openingStateFlag = .mother_moved
                
                let headNode = partyCharacterNodes.first!
                headNode.positionX = AliahanTownMotherWaitingPositionX - 1
                headNode.positionY = AliahanTownMotherWaitingPositionY
                
                let text1 = "＊「ここから　まっすぐいくと"
                let text2 = "　　おしろ　です。"
                
                self.mapMessageWindowNode = MapMessageWindowNode()
                self.mapMessageWindowNode.addToNode(
                    node: self.scene,
                    pointX: MapMessageWindowChildOfScenePointX,
                    pointY: MapMessageWindowChildOfScenePointY,
                    scale: self.scene.scale)
                
                self.mapMessageWindowNode.showMessages(
                    text1: text1,
                    text2: text2,
                    text3: nil,
                    withSe: true,
                    withNextMark: true,
                    completion: {
                        self.openingStateFlag = .message_one_end
                    })
            })
        }
        
        // debug!!!
      //  self.showInsideTileMap(insideTileMapNode: self.insideTileMapNode)
    }
}

//
//  AliahanTownHouseScene.swift
//  DQ3
//
//  Created by aship on 2020/12/31.
//

import SpriteKit

class AliahanTownHouseScene: DQMapScene {
    enum OpeningStateFlag {
        case none
        case message_one_start
        case message_one_end
        case message_two_start
        case message_two_end
        case message_three_start
        case message_three_end
        case mother_moving
        case mother_moved
        case mother_start_escorting
    }
    
    var openingStateFlag: OpeningStateFlag = .none
    
    func setup() {
        DataManager.dqSceneType = .aliahan_town_house
        AudioManager.play(dqAudio: .town)
        
        self.scene.backgroundColor = UIColor.rgba(red: 71,
                                                  green: 192,
                                                  blue: 252,
                                                  alpha: 1)
        
        self.scene.addMainTileMap(name: "aliahan_town_house",
                                  tileMapNode: &self.mainTileMapNode,
                                  numberOfImages: 9,
                                  scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           dqStory: DataManager.dqStory,
                           scale: self.scene.scale)
        
        addNpcCharacters(tileMapNode: self.mainTileMapNode,
                         dqStory: DataManager.dqStory,
                         scale: self.scene.scale)
        
        if DataManager.dqStory == .opening {
            let text1 = "＊「おはよう　えにくす。"
            let text2 = "　　もう　あさですよ。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: scene!,
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: true,
                pointX: MapMessageWindowChildOfScenePointX,
                pointY: MapMessageWindowChildOfScenePointY,
                scale: self.scene.scale,
                completion: {
                    self.openingStateFlag = .message_one_end
                })
        }
    }
}

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
        AudioManager.play(dqAudio: .town)
        
        self.scene.backgroundColor =  UIColor.rgba(red: 71,
                                                   green: 192,
                                                   blue: 252,
                                                   alpha: 1)
        
        addMainTileMap(name: "aliahan_town_house",
                       tileMapNode: &self.mainTileMapNode,
                       numberOfImages: 9,
                       scale: self.scene.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           dqStory: DataManager.dqStory,
                           scale: self.scene.scale)
        
        addNpcCharacters(tileMapNode: self.mainTileMapNode,
                         characterNpcNodes: &self.characterNpcNodes,
                         scale: self.scene.scale,
                         dqStory: DataManager.dqStory)
        
        setNpcMove(characterNodes: DataManager.characterNodes,
                   characterNpcNodes: self.characterNpcNodes,
                   tileMapNode: self.mainTileMapNode,
                   scale: self.scene.scale,
                   dqStory: DataManager.dqStory)
        
        if DataManager.dqStory == .opening {
            let text1 = "＊「おはよう　えにくす。"
            let text2 = "　　もう　あさですよ。"
            
            showMessages(text1: text1,
                         text2: text2,
                         text3: nil,
                         withSe: true,
                         withNextMark: true,
                         messageWindowNode: &self.messageWindowNode,
                         isMessageWindowOpen: &self.isMessageWindowOpen,
                         scale: self.scene.scale,
                         completion: {
                            self.openingStateFlag = .message_one_end
                         })
        }
    }
}

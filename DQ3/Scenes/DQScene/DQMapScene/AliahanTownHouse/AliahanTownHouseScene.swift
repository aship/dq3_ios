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
        DataManager.adventureLog.dqSceneType = .aliahan_town_house
        
        AudioManager.play(dqAudio: .town)
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/AliahanTownHouse/AliahanTownHouseScene.swift

        self.scene.backgroundColor = UIColor(
            red: 71 / 255,
            green: 192 / 255,
            blue: 252 / 255,
            alpha: 1)

        self.scene.addMainTileMap(
            name: "aliahan_town_house",
            tileMapNode: &self.mainTileMapNode,
            numberOfImages: 9,
            scale: self.scene.scale)

        addPartyCharacters(
            tileMapNode: self.mainTileMapNode,
            dqStory: DataManager.dqStory,
            scale: self.scene.scale)

        addNpcCharacters(
            tileMapNode: self.mainTileMapNode,
            dqStory: DataManager.dqStory,
            scale: self.scene.scale)

        if DataManager.dqStory == .opening {
========
        
        self.scene.backgroundColor = UIColor(red: 71 / 255,
                                             green: 192 / 255,
                                             blue: 252 / 255,
                                             alpha: 1)
        let scale = self.scene.scale
        
        addMainTileMap(name: "aliahan_town_house",
                       tileMapNode: &self.mainTileMapNode,
                       numberOfImages: 9,
                       scale: scale)
        
        let dqStory = DataManager.adventureLog.dqStory
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           dqStory: dqStory,
                           scale: scale)
        
        addNpcCharacters(tileMapNode: self.mainTileMapNode,
                         characterNpcNodes: &self.characterNpcNodes,
                         scale: scale,
                         dqStory: dqStory)
        
        if dqStory == .opening {
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/AliahanTownHouse/AliahanTownHouseScene.swift
            let text1 = "＊「おはよう　えにくす。"
            let text2 = "　　もう　あさですよ。"

            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.addToScene(
                node: self.scene,
                pointX: MapMessageWindowChildOfScenePointX,
                pointY: MapMessageWindowChildOfScenePointY,
                scale: scale)
            
            self.mapMessageWindowNode.showMessages(
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: true,
                completion: {
                    self.openingStateFlag = .message_one_end
                })
        }
    }
}

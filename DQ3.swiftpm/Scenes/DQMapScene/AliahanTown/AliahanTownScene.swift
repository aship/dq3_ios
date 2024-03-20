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

    let greenBGColor = UIColor(
        red: 166 / 255,
        green: 226 / 255,
        blue: 70 / 255,
        alpha: 1)
    func setup() {
        DataManager.dqSceneType = .aliahan_town
        AudioManager.play(dqAudio: .town)

        self.scene.backgroundColor = UIColor(
            red: 166 / 255,
            green: 226 / 255,
            blue: 70 / 255,
            alpha: 1)

        self.scene.addMainTileMap(
            name: "aliahan_town",
            tileMapNode: &self.mainTileMapNode,
            numberOfImages: 20,
            scale: self.scene.scale)

        self.scene.addInsideTileMap(
            name: "aliahan_town_inside",
            mainTileMapNode: self.mainTileMapNode,
            insideTileMapNode: &self.insideTileMapNode,
            numberOfImages: 12)

        if DataManager.showInsideMap {
            self.scene.showInsideTileMap(insideTileMapNode: self.insideTileMapNode)

            DataManager.showInsideMap = false
        }

        addPartyCharacters(
            tileMapNode: self.mainTileMapNode,
            scale: self.scene.scale)

        addNpcCharacters(
            tileMapNode: self.mainTileMapNode,
            dqStory: DataManager.dqStory,
            scale: self.scene.scale)

        if DataManager.dqStory == .opening {
            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()
            headNode.initDirection(direction: .left)

            self.motherAndHeroMove(completion: {
                self.openingStateFlag = .mother_moved

                let headNode = DataManager.adventureLog.partyCharacterNodes.first!
                headNode.positionX = AliahanTownMotherWaitingPositionX - 1
                headNode.positionY = AliahanTownMotherWaitingPositionY

                let text1 = "＊「ここから　まっすぐいくと"
                let text2 = "　　おしろ　です。"

                self.mapMessageWindowNode = MapMessageWindowNode()
                self.mapMessageWindowNode.showMessages(
                    scene: self.scene,
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
            })
        }
    }
}

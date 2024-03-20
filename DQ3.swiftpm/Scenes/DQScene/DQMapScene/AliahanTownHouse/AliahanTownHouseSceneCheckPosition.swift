//
//  AliahanTownHouseSceneCheckPosition.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownHouseScene {
    func checkPosition(
        newPositionX: Int,
        newPositionY: Int
    ) {
        let dqStory = DataManager.adventureLog.dqStory

        var enterAliahanTown = false
        var enterMotherEscorting = false

        if newPositionX == AliahanTownHouseStairsPositionX
            && newPositionY == AliahanTownHouseStairsPositionY
        {
            enterAliahanTown = true
        } else if dqStory == .opening {
            if newPositionX == AliahanTownHouseMotherCallPositionX {
                enterMotherEscorting = true
            }
        }

        if enterAliahanTown {
            DataManager.showInsideMap = true
            DataManager.queueFollowDirections = []

            for node in DataManager.adventureLog.partyCharacterNodes {
                node.positionX = AliahanTownStairsToHousePositionX
                node.positionY = AliahanTownStairsToHousePositionY
                node.direction = .left
            }

            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()

            DataManager.showInsideMap = true
            DataManager.queueFollowDirections = []

            for node in DataManager.adventureLog.partyCharacterNodes {
                node.positionX = AliahanTownStairsToHousePositionX
                node.positionY = AliahanTownStairsToHousePositionY
                node.direction = .left
            }

            self.scene.transitionToMapWithStairs(
                dqSceneTypeFrom: .aliahan_town_house,
                dqSceneTypeTo: .aliahan_town,
                dqAudio: .town)
        } else if enterMotherEscorting {
            self.openingStateFlag = .mother_start_escorting

            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()

            let text1 = "＊「さあ　かあさんに"
            let text2 = "　　ついて　いらっしゃい。"

            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.addToScene(
                node: self.scene,
                pointX: MapMessageWindowChildOfScenePointX,
                pointY: MapMessageWindowChildOfScenePointY,
                scale: self.scene.scale)

            self.mapMessageWindowNode.showMessages(
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: false,
                completion: {
                })

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.mapMessageWindowNode.close()

                if newPositionY == 2 {
                    self.motherAndHeroMoveCatchUp2(completion: {
                        headNode.positionX += 2

                        self.checkPosition(
                            newPositionX: headNode.positionX,
                            newPositionY: headNode.positionY)
                    })
                } else if newPositionY == 1 {
                    self.motherAndHeroMoveCatchUp1(completion: {
                        headNode.positionX += 2
                        headNode.positionY += 1

                        self.checkPosition(
                            newPositionX: headNode.positionX,
                            newPositionY: headNode.positionY)
                    })
                }
            }
        }
    }
}

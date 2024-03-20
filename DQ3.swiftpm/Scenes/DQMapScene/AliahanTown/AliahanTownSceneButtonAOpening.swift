//
//  AliahanTownSceneButtonAOpening.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension AliahanTownScene {
    func processButtonAOpening(
        mapMessageWindowNode: MapMessageWindowNode,
        openingStateFlag: inout OpeningStateFlag
    ) {
        if openingStateFlag == .mother_moving || openingStateFlag == .message_one_start
            || openingStateFlag == .message_two_start || openingStateFlag == .finished
        {
            return
        }

        if openingStateFlag == .message_one_end {
            openingStateFlag = .message_two_start

            let text1 = "＊「おうさまに　ちゃんと"
            let text2 = "　　あいさつ　するのですよ。"
            let text3 = "　　さあ　いってらっしゃい。"

            self.mapMessageWindowNode.nextMark.removeFromParent()

            Task {
                await mapMessageWindowNode.showMessage(
                    string: text1,
                    line: 2,
                    withSe: true)

                await mapMessageWindowNode.showMessage(
                    string: text2,
                    line: 3,
                    withSe: true)

                await mapMessageWindowNode.moveLine()

                await mapMessageWindowNode.showMessage(
                    string: text3,
                    line: 3,
                    withSe: true)

                await mapMessageWindowNode.moveLine()

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    let headNode = DataManager.adventureLog.partyCharacterNodes.first!
                    headNode.setMovePermitted()

                    mapMessageWindowNode.close()

                    self.openingStateFlag = .finished
                    DataManager.dqStory = .mother_waiting
                }
            }
        }
    }
}

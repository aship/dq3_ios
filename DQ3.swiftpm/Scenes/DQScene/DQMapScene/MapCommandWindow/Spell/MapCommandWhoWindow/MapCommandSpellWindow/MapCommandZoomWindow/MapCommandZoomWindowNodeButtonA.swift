//
//  MapCommandZoomWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

extension MapCommandZoomWindowNode {
    func processButtonA() {
        if self.isProcessing {
            return
        }

        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)

        if self.dqZoom == .next_page {
            self.page += 1

            if self.page == 4 {
                self.page = 0
            }

            self.delegate!.doSomething(page: self.page)

            return
        }

        pauseTriangleAnimation(triangleNode: self.triangleNode)

        // ルーラの行き先を保存(ラーミア、船の位置決定で使う)
        DataManager.currentZoomArea = self.dqZoom

        self.isProcessing = true
        let text1 = "ルーラをとなえた！！"

        self.mapMessageWindowNode = MapMessageWindowNode()
        self.mapMessageWindowNode?.addToNode(
            node: self,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY + 112,
            scale: 1)

        self.mapMessageWindowNode?.showMessages(
            text1: text1,
            text2: nil,
            text3: nil,
            withSe: false,
            withNextMark: false,
            completion: {
            })

        print("self.dqZoom \(self.dqZoom)")

        let values = getZoomPosition(dqZoom: self.dqZoom)

        let positionX = values.0
        let positionY = values.1

        for node in DataManager.adventureLog.partyCharacterNodes {
            node.positionX = positionX
            node.positionY = positionY
            node.direction = .down
        }

        let dqSceneType = DataManager.adventureLog.dqSceneType

        if self.dqZoom == .tantegel || self.dqZoom == .damdara || self.dqZoom == .cantlin
            || self.dqZoom == .kol || self.dqZoom == .rimuldar
        {
            // temporary アレフガルド
            DataManager.scene.transitionToMapWithZoom(
                dqSceneTypeFrom: dqSceneType,
                dqSceneTypeTo: .alefgard,
                dqAudio: .alefgard)
        } else {
            DataManager.scene.transitionToMapWithZoom(
                dqSceneTypeFrom: dqSceneType,
                dqSceneTypeTo: .field,
                dqAudio: .field)
        }
    }
}

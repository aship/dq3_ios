//
//  FieldSceneButtonARamia.swift
//  DQ3
//
//  Created by aship on 2021/05/12.
//

import SpriteKit

extension FieldScene {
    func processButtonARamia(
        mapCommandWindowNode: inout MapCommandWindowNode,
        mapStatusWindowNode: inout MapStatusWindowNode,
        characterNpcNodes: [CharacterNode],
        partyCharacterNodes: inout [CharacterNode],
        queueFollowDirections: inout [Direction],
        tileMapNode: SKTileMapNode,
        scene: BaseScene,
        scale: CGFloat
    ) {
        let headNode = partyCharacterNodes.first!
        let ramiaNode = self.ramiaNode!

        if scene.fieldMoveMode == .walk && self.ramiaNode?.positionX == headNode.positionX
            && self.ramiaNode?.positionY == headNode.positionY
        {
            self.processRideOnRamia(
                tileMapNode: tileMapNode,
                ramiaNode: ramiaNode,
                fieldMoveMode: &scene.fieldMoveMode,
                characterNodes: &partyCharacterNodes,
                queueFollowDirections: queueFollowDirections,
                scale: scale)
        } else if scene.fieldMoveMode == .ramia {
            processButtonAOnRamia(
                ramiaNode: ramiaNode,
                partyCharacterNodes: partyCharacterNodes,
                queueFollowDirections: &queueFollowDirections,
                tileMapNode: tileMapNode,
                scene: scene,
                scale: scale)
        } else {
            showCommandWindow(
                mapCommandWindowNode: &mapCommandWindowNode,
                partyCharacterNodes: partyCharacterNodes,
                characterNpcNodes: characterNpcNodes,
                scene: scene,
                scale: scale)

            showStatusWindow(
                mapStatusWindowNode: &mapStatusWindowNode,
                partyCharacterNodes: partyCharacterNodes,
                scene: scene,
                scale: scene.scale)
        }
    }

    private func processButtonAOnRamia(
        ramiaNode: CharacterNode,
        partyCharacterNodes: [CharacterNode],
        queueFollowDirections: inout [Direction],
        tileMapNode: SKTileMapNode,
        scene: BaseScene,
        scale: CGFloat
    ) {
        let headNode = partyCharacterNodes.first!

        let canGetOffRamia = checkGetOffRamia(
            tileMapNode: tileMapNode,
            positionX: headNode.positionX,
            positionY: headNode.positionY)
        if canGetOffRamia {
            queueFollowDirections = []

            processGetOffRamia(
                tileMapNode: tileMapNode,
                ramiaNode: ramiaNode,
                fieldMoveMode: &scene.fieldMoveMode,
                characterNodes: partyCharacterNodes,
                scale: scale)
        } else {
            Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { (timer) in
                // moving が終わるまで待つ
                if !headNode.isMoving {
                    headNode.setMoveProhibited()

                    let text1 = "ここでは　おりられない！"

                    self.mapMessageWindowNode = MapMessageWindowNode()
                    self.mapMessageWindowNode.addToNode(
                        node: scene,
                        pointX: MapMessageWindowChildOfScenePointX,
                        pointY: MapMessageWindowChildOfScenePointY,
                        scale: scale)

                    self.mapMessageWindowNode.showMessages(
                        text1: text1,
                        text2: nil,
                        text3: nil,
                        withSe: false,
                        withNextMark: false,
                        completion: {
                        })

                    timer.invalidate()
                }
            }
        }
    }
}

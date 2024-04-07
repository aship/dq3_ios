//
//  FieldSceneRamiaGetOff.swift
//  DQ3
//
//  Created by aship on 2021/04/25.
//

import SpriteKit

extension FieldScene {
    func checkGetOffRamia(
        tileMapNode: SKTileMapNode,
        positionX: Int,
        positionY: Int
    ) -> Bool {
        let tileGroup = tileMapNode.tileGroup(
            atColumn: positionX,
            row: positionY)
        let name = tileGroup?.name

        if name == "tile0" || name == "tile1" || name == "tile2" || name == "tile4"
            || name == "tile6" || name == "tile7" || name == "tile10" || name == "tile11"
            || name == "tile12" || name == "tile13" || name == "tile14" || name == "tile15"
            || name == "tile16" || name == "tile17" || name == "tile18" || name == "tile19"
            || name == "tile21" || name == "tile22" || name == "tile23" || name == "tile24"
            || name == "tile25" || name == "tile28" || name == "tile29" || name == "tile33"
            || name == "tile37" || name == "tile39" || name == "tile40" || name == "tile42"
            || name == "tile43" || name == "tile44"
        {
            return false
        }

        return true
    }

    func processGetOffRamia(
        tileMapNode: SKTileMapNode,
        ramiaNode: CharacterNode,
        fieldMoveMode: inout FieldMoveMode,
        characterNodes: [CharacterNode],
        scale: CGFloat
    ) {
        fieldMoveMode = .walk
        AudioManager.stop()

        let headNode = characterNodes.first!

        Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { (timer) in
            // moving が終わるまで待つ
            if !headNode.isMoving {
                // ラーミアを配列から削除
                DataManager.adventureLog.partyCharacterNodes.remove(at: 0)

                // ラーミアの位置を保存
                DataManager.ramiaPositionX = ramiaNode.positionX
                DataManager.ramiaPositionY = ramiaNode.positionY
                DataManager.ramiaDirection = ramiaNode.direction

                // head を勇者にする
                for node in DataManager.adventureLog.partyCharacterNodes {
                    node.isHidden = false

                    node.positionX = ramiaNode.positionX
                    node.positionY = ramiaNode.positionY
                    node.changeDirection(direction: ramiaNode.direction)
                    node.setPosition(
                        tileMapNode: tileMapNode,
                        withMoveMap: false,
                        scale: scale)
                }

                AudioManager.play(dqAudio: .field)

                timer.invalidate()
            }
        }
    }
}

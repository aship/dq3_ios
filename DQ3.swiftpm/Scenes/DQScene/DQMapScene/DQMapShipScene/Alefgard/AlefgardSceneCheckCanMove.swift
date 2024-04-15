//
//  AlefgardSceneCheckCanMove.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AlefgardScene {
    func checkCanMove(
        tileMapNode: SKTileMapNode,
        newPositionX: Int,
        newPositionY: Int
    ) -> Bool {
        if self.scene.fieldMoveMode == .walk {
            // 船がある場合は行ける
            if let shipNode = self.shipNode {
                if shipNode.positionX == newPositionX && shipNode.positionY == newPositionY {
                    return true
                }
            }

            let tileGroup = tileMapNode.tileGroup(
                atColumn: newPositionX,
                row: newPositionY)
            let name = tileGroup?.name

            if name == "tile0" || name == "tile1" || name == "tile2" || name == "tile3"
                || name == "tile4" || name == "tile5" || name == "tile6" || name == "tile7"
                || name == "tile8" || name == "tile10" || name == "tile12" || name == "tile17"
                || name == "tile18" || name == "tile19" || name == "tile20" || name == "tile21"
                || name == "tile26" || name == "tile27" || name == "tile28" || name == "tile29"
                || name == "tile38" || name == "tile39" || name == "tile40" || name == "tile41"
                || name == "tile42" || name == "tile43" || name == "tile44"
            {
                return false
            }
        } else if self.scene.fieldMoveMode == .ship {
            let tileGroup = tileMapNode.tileGroup(
                atColumn: newPositionX,
                row: newPositionY)
            let name = tileGroup?.name

            if name == "tile0" || name == "tile1" || name == "tile2" || name == "tile3"
                || name == "tile4" || name == "tile21" || name == "tile29" || name == "tile42"
                || name == "tile43" || name == "tile44"
            {
                return false
            }
        }

        return true
    }
}

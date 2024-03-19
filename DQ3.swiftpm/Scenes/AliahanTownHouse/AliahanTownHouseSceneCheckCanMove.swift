//
//  AliahanTownHouseSceneCheckCanMove.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownHouseScene {
    func checkCanMove(
        tileMapNode: SKTileMapNode,
        newPositionX: Int,
        newPositionY: Int
    ) -> Bool {
        let tileGroup = tileMapNode.tileGroup(
            atColumn: newPositionX,
            row: newPositionY)
        let name = tileGroup?.name

        if name == "tile0" || name == "tile1" || name == "tile2" || name == "tile4"
            || name == "tile5" || name == "tile7"
        {
            return false
        }

        return true
    }
}

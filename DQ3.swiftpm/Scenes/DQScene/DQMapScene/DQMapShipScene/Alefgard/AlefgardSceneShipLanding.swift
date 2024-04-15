//
//  AlefgardSceneShipLanding.swift
//  DQ3
//
//  Created by aship on 2021/05/05.
//

import SpriteKit

extension AlefgardScene {
    func checkLandingFromShip(
        tileMapNode: SKTileMapNode,
        newPositionX: Int,
        newPositionY: Int
    ) -> Bool {
        let tileGroup = tileMapNode.tileGroup(
            atColumn: newPositionX,
            row: newPositionY)
        let name = tileGroup?.name

        if name == "tile9" || name == "tile11" || name == "tile13" || name == "tile14"
            || name == "tile15" || name == "tile16" || name == "tile22" || name == "tile23"
            || name == "tile24" || name == "tile25" || name == "tile30" || name == "tile31"
            || name == "tile32" || name == "tile33" || name == "tile34" || name == "tile35"
            || name == "tile36" || name == "tile37"
        {
            return true
        }

        return false
    }
}

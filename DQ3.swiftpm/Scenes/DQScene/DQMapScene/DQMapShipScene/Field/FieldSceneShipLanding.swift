//
//  FieldSceneShipLanding.swift
//  DQ3
//
//  Created by aship on 2021/05/05.
//

import SpriteKit

extension FieldScene {
    func checkLandingFromShip(
        tileMapNode: SKTileMapNode,
        newPositionX: Int,
        newPositionY: Int
    ) -> Bool {
        let tileGroup = tileMapNode.tileGroup(
            atColumn: newPositionX,
            row: newPositionY)
        let name = tileGroup?.name

        if name == "tile3" || name == "tile5" || name == "tile8" || name == "tile9"
            || name == "tile11" || name == "tile17" || name == "tile18" || name == "tile20"
            || name == "tile25" || name == "tile26" || name == "tile27" || name == "tile28"
            || name == "tile29" || name == "tile30" || name == "tile31" || name == "tile32"
            || name == "tile33" || name == "tile34" || name == "tile35" || name == "tile36"
            || name == "tile38" || name == "tile41"
        {
            return true
        }

        return false
    }
}

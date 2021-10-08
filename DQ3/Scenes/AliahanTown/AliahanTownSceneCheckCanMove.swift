//
//  AliahanTownSceneCheckCanMove.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension AliahanTownScene {
    override func checkCanMove(tileMapNode: SKTileMapNode,
                               newPositionX: Int,
                               newPositionY: Int) -> Bool {
        let tileGroup = tileMapNode.tileGroup(atColumn: newPositionX,
                                              row: newPositionY)
        let name = tileGroup?.name
        
        if name == "tile0" ||
            name == "tile1" ||
            name == "tile2" ||
            name == "tile11" ||
            name == "tile13" ||
            name == "tile15" ||
            name == "tile17" ||
            name == "tile18" ||
            name == "tile19" {
            return false
        }
        
        return true
    }
}
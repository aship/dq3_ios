//
//  WindowTile.swift
//  DQ3
//
//  Created by aship on 2021/01/16.
//

import SpriteKit

func getTileGroups() -> [SKTileGroup] {
    let size8 = CGSize(width: 8, height: 8)

    var tileGroups: [SKTileGroup] = []

    let array = [
        "left_up",
        "up",
        "right_up",
        "left",
        "space",
        "right",
        "left_down",
        "down",
        "right_down",
    ]

    for name in array {
        let texture = SKTexture(imageNamed: "font/window/\(name)")

        let definition = SKTileDefinition(
            textures: [texture],
            size: size8,
            timePerFrame: 0)

        let tileGroup = SKTileGroup(tileDefinition: definition)

        tileGroups.append(tileGroup)
    }

    return tileGroups
}

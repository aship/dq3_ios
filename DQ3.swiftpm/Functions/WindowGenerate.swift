//
//  WindowGenerate.swift
//
//
//  Created by aship on 2024/04/16.
//

import SpriteKit

func generateWindow(
    pointX: Int,
    pointY: Int,
    numberOfColumns: Int,
    numberOfRows: Int,
    scale: CGFloat
) -> SKTileMapNode {
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

    let tileSet = SKTileSet(tileGroups: tileGroups)

    let tileMapNode = SKTileMapNode(
        tileSet: tileSet,
        columns: numberOfColumns,
        rows: numberOfRows,
        tileSize: size8)

    // 8方向隣接ノードのオートマッピング機能を無効にする。
    tileMapNode.enableAutomapping = false

    var raw = numberOfRows - 1

    // 上段

    // 左上
    for column in 0...0 {
        let tileGroup = tileSet.tileGroups[0]

        tileMapNode.setTileGroup(
            tileGroup,
            forColumn: column,
            row: raw)
    }
    // 上
    for column in 1...numberOfColumns - 2 {
        let tileGroup = tileSet.tileGroups[1]

        tileMapNode.setTileGroup(
            tileGroup,
            forColumn: column,
            row: raw)
    }

    // 右上
    for column in numberOfColumns - 1...numberOfColumns - 1 {
        let tileGroup = tileSet.tileGroups[2]

        tileMapNode.setTileGroup(
            tileGroup,
            forColumn: column,
            row: raw)
    }

    // 中段
    for i in 1...numberOfRows - 2 {
        raw = numberOfRows - 1 - i

        // 左
        for column in 0...0 {
            let tileGroup = tileSet.tileGroups[3]

            tileMapNode.setTileGroup(
                tileGroup,
                forColumn: column,
                row: raw)
        }
        // 中
        for column in 1...numberOfColumns - 2 {
            let tileGroup = tileSet.tileGroups[4]

            tileMapNode.setTileGroup(
                tileGroup,
                forColumn: column,
                row: raw)
        }

        // 右
        for column in numberOfColumns - 1...numberOfColumns - 1 {
            let tileGroup = tileSet.tileGroups[5]

            tileMapNode.setTileGroup(
                tileGroup,
                forColumn: column,
                row: raw)
        }
    }

    // 下段
    raw = 0

    // 左下
    for column in 0...0 {
        let tileGroup = tileSet.tileGroups[6]

        tileMapNode.setTileGroup(
            tileGroup,
            forColumn: column,
            row: raw)
    }

    // 下
    for column in 1...numberOfColumns - 2 {
        let tileGroup = tileSet.tileGroups[7]

        tileMapNode.setTileGroup(
            tileGroup,
            forColumn: column,
            row: raw)
    }

    // 右下
    for column in numberOfColumns - 1...numberOfColumns - 1 {
        let tileGroup = tileSet.tileGroups[8]

        tileMapNode.setTileGroup(
            tileGroup,
            forColumn: column,
            row: raw)
    }

    tileMapNode.setScale(scale)
    tileMapNode.anchorPoint = CGPoint(
        x: 0,
        y: 1)
    tileMapNode.position = CGPoint(
        x: CGFloat(pointX) * scale,
        y: CGFloat(pointY) * scale)
    return tileMapNode
}

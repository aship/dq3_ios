//
//  Window.swift
//  DQ3
//
//  Created by aship on 2021/01/21.
//

import SpriteKit

func setWindow(
    tileMapNode: SKTileMapNode,
    numberOfColumns: Int,
    numberOfRows: Int,
    tileSet: SKTileSet
) {
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
}

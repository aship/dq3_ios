//
//  DQMapSceneTileMap.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

<<<<<<<< HEAD:DQ3.swiftpm/Scenes/Base/BaseMap/BaseMapSceneTileMap.swift
extension BaseMapScene {
    func showMainTileMap(
        color: UIColor,
        insideTileMapNode: SKTileMapNode
    ) {
        self.backgroundColor = color
========
extension DQMapScene {
    func showMainTileMap(color: UIColor,
                         insideTileMapNode: SKTileMapNode) {
        self.scene.backgroundColor = color
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/DQMapSceneTileMap.swift
        insideTileMapNode.alpha = 0
    }

    func showInsideTileMap(insideTileMapNode: SKTileMapNode) {
        self.scene.backgroundColor = .black
        insideTileMapNode.alpha = 1
    }

    func addMainTileMap(
        name: String,
        tileMapNode: inout SKTileMapNode?,
        numberOfImages: Int,
        scale: CGFloat
    ) {
        tileMapNode = generateTileMap(
            name: name,
            numberOfImages: numberOfImages)
        tileMapNode?.zPosition = ZPositionMainMap
        tileMapNode?.setScale(scale)
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/Base/BaseMap/BaseMapSceneTileMap.swift

        self.addChild(tileMapNode!)
========
        
        self.scene.addChild(tileMapNode!)
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/DQMapSceneTileMap.swift
    }

    func addInsideTileMap(
        name: String,
        mainTileMapNode: SKTileMapNode?,
        insideTileMapNode: inout SKTileMapNode?,
        numberOfImages: Int
    ) {
        insideTileMapNode = generateTileMap(
            name: name,
            numberOfImages: numberOfImages)
        insideTileMapNode?.alpha = 0
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/Base/BaseMap/BaseMapSceneTileMap.swift

========
        insideTileMapNode?.zPosition = ZPositionInsideMap
        
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/DQMapSceneTileMap.swift
        mainTileMapNode?.addChild(insideTileMapNode!)
    }

    private func generateTileMap(
        name: String,
        numberOfImages: Int
    ) -> (SKTileMapNode) {
        let size16 = CGSize(width: 16, height: 16)

        var tileGroups: [SKTileGroup] = []

        for number in 0..<numberOfImages {
            let texture = SKTexture(imageNamed: "map/\(name)/\(number).png")

            let definition = SKTileDefinition(
                textures: [texture],
                size: size16,
                timePerFrame: 0)

            let tileGroup = SKTileGroup(tileDefinition: definition)
            tileGroup.name = "tile\(number)"

            tileGroups.append(tileGroup)
        }

        let tileSet = SKTileSet(tileGroups: tileGroups)

        // csv から column, row 数を取得
        var numberOfColumn: Int!
        var numberOfRow: Int!

        let path = Bundle.module.path(
            forResource: "csv/" + name,
            ofType: "csv")

        do {
            let csvString = try String(
                contentsOfFile: path!,
                encoding: String.Encoding.utf8)
            var csvLines = csvString.components(separatedBy: .newlines)
            csvLines.removeLast()

            numberOfRow = csvLines.count

            for (_, line) in csvLines.enumerated() {
                let arr = line.components(separatedBy: ",")

                numberOfColumn = arr.count

                break
            }
        } catch {}

        let tileMapNode = SKTileMapNode(
            tileSet: tileSet,
            columns: numberOfColumn,
            rows: numberOfRow,
            tileSize: size16)

        // 8方向隣接ノードのオートマッピング機能を無効にする。
        tileMapNode.enableAutomapping = false

        do {
            let csvString = try String(
                contentsOfFile: path!,
                encoding: String.Encoding.utf8)
            var csvLines = csvString.components(separatedBy: .newlines)
            csvLines.removeLast()

            for (row, line) in csvLines.enumerated() {
                let arr = line.components(separatedBy: ",")

                for (column, value) in arr.enumerated() {
                    let groupIndex = Int(value.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
                    let tileGroup = tileSet.tileGroups[groupIndex]

                    tileMapNode.setTileGroup(
                        tileGroup,
                        forColumn: column,
                        row: numberOfRow - 1 - row)
                }
            }
        } catch {}

        return tileMapNode
    }
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/Base/BaseMap/BaseMapSceneTileMap.swift

    func getTileMapNode(dqSceneType: DQSceneType) -> SKTileMapNode {
        var tileMapNode: SKTileMapNode!

        switch dqSceneType {
        case .opening: break
        case .aliahan_town: tileMapNode = self.aliahanTownScene.mainTileMapNode
        case .aliahan_town_house: tileMapNode = self.aliahanTownHouseScene.mainTileMapNode
        }

        return tileMapNode
    }
========
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/DQMapSceneTileMap.swift
}

//
//  BaseSceneTileMap.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BaseMapScene {
    func showMainTileMap(color: UIColor) {
        self.backgroundColor = color
        self.insideTileMapNode.alpha = 0
    }
    
    func showInsideTileMap() {
        self.backgroundColor = .black
        self.insideTileMapNode.alpha = 1
    }
    
    func addMainTileMap(name: String,
                        tileMapNode: inout SKTileMapNode?,
                        numberOfImages: Int,
                        scale: CGFloat) {
        let values = generateTileMap(name: name,
                                     numberOfImages: numberOfImages)
        
        tileMapNode = values.0
        let numberOfColumns = values.1
        let numberOfRows = values.2
        
        var pointX: CGFloat = 0
        var pointY: CGFloat = 0
        
        if !numberOfColumns.isMultiple(of: 2)  {
            // 横のキャラ数が奇数の場合
            // x=0 の位置をキャラの境界線に置きたいので
            // 8 pixel 右にずらす(あまりないが横1キャラの時を考慮すると左はNG)
            pointX = 16 / 2 * scale
        }
        
        if numberOfRows.isMultiple(of: 2)  {
            // 縦のキャラ数が偶数の場合
            // y=0 の位置がキャラの中心を通るようにしたいので
            // 8 pixel 上にずらす(下でもよいが他のパラメータが変わる)
            pointY = 16 / 2 * scale
        }
        
        tileMapNode?.setScale(scale)
        tileMapNode?.position = CGPoint(x: pointX, y: pointY)
        
        self.addChild(tileMapNode!)
    }
    
    func addInsideTileMap(name: String,
                          mainTileMapNode: SKTileMapNode?,
                          insideTileMapNode: inout SKTileMapNode?,
                          numberOfImages: Int) {
        let values = generateTileMap(name: name,
                                     numberOfImages: numberOfImages)
        
        insideTileMapNode = values.0
        insideTileMapNode?.alpha = 0
        
        mainTileMapNode!.addChild(insideTileMapNode!)
    }
    
    private func generateTileMap(name: String,
                                 numberOfImages: Int) -> (SKTileMapNode, Int, Int) {
        let size16 = CGSize(width: 16, height: 16)
        
        var tileGroups: [SKTileGroup] = []
        
        for number in 0 ..< numberOfImages {
            let texture = SKTexture(imageNamed: "map/\(name)/\(number).png")
            
            let definition = SKTileDefinition(textures: [texture],
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
        
        let path = Bundle.main.path(forResource: name,
                                    ofType: "csv")
        do {
            let csvString = try String(contentsOfFile: path!,
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
        
        let tileMapNode = SKTileMapNode(tileSet: tileSet,
                                        columns: numberOfColumn,
                                        rows: numberOfRow,
                                        tileSize: size16)
        
        // 8方向隣接ノードのオートマッピング機能を無効にする。
        tileMapNode.enableAutomapping = false
        
        do {
            let csvString = try String(contentsOfFile: path!,
                                       encoding: String.Encoding.utf8)
            var csvLines = csvString.components(separatedBy: .newlines)
            csvLines.removeLast()
            
            for (row, line) in csvLines.enumerated() {
                let arr = line.components(separatedBy: ",")
                
                for (column, value) in arr.enumerated() {
                    let groupIndex = Int(value.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
                    let tileGroup = tileSet.tileGroups[groupIndex]
                    
                    tileMapNode.setTileGroup(tileGroup,
                                             forColumn: column,
                                             row: numberOfRow - 1 - row)
                }
            }
        }
        catch {}
        
        return (tileMapNode, numberOfColumn, numberOfRow)
    }
}

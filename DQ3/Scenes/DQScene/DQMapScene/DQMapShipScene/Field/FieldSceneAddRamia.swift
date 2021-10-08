//
//  FieldSceneAddRamia.swift
//  DQ3
//
//  Created by aship on 2021/03/26.
//

import SpriteKit

extension FieldScene {
    func addRamia(tileMapNode: SKTileMapNode,
                  characterNode: inout CharacterNode?,
                  scale: CGFloat) {
        if DataManager.resetRamiaPosition {
            // 冒険の書読み込み時、またはルーラしたら
            // ラーミアの位置をリセット
            let values = getRamiaDefaltPosition(dqZoom: DataManager.currentZoomArea)
            DataManager.ramiaPositionX = values.0
            DataManager.ramiaPositionY = values.1
            
            DataManager.resetRamiaPosition = false
        }
        
        addVehicleToMap(name: "ramia",
                        dqCharacter: .ramia,
                        positionX: DataManager.ramiaPositionX,
                        positionY: DataManager.ramiaPositionY,
                        direction: DataManager.ramiaDirection,
                        tileMapNode: tileMapNode,
                        characterNode: &characterNode,
                        scale: scale)
    }
}


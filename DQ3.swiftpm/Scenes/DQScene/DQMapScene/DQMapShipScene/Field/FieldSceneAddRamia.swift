//
//  FieldSceneAddRamia.swift
//  DQ3
//
//  Created by aship on 2021/03/26.
//

import SpriteKit

extension FieldScene {
    func addRamia(
        tileMapNode: SKTileMapNode,
        characterNode: inout CharacterNode?,
        scale: CGFloat
    ) {
        let values = getRamiaDefaltPosition()
        DataManager.ramiaPositionX = values.0
        DataManager.ramiaPositionY = values.1

        addVehicleToMap(
            name: "ramia",
            dqCharacter: .ramia,
            positionX: DataManager.ramiaPositionX,
            positionY: DataManager.ramiaPositionY,
            direction: DataManager.ramiaDirection,
            tileMapNode: tileMapNode,
            characterNode: &characterNode,
            scale: scale)
    }
}

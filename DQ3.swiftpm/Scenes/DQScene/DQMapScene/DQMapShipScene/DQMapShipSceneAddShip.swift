//
//  FieldSceneVehicleCharacters.swift
//  DQ3
//
//  Created by aship on 2021/03/26.
//

import SpriteKit

extension DQMapShipScene {
    func addShip(
        tileMapNode: SKTileMapNode,
        characterNode: inout CharacterNode?,
        scale: CGFloat
    ) {
        if self.scene.fieldMoveMode == .walk {
            let values = getShipDefaltPosition()
            DataManager.shipPositionX = values.0
            DataManager.shipPositionY = values.1

            addVehicleToMap(
                name: "ship",
                dqCharacter: .ship,
                positionX: DataManager.shipPositionX,
                positionY: DataManager.shipPositionY,
                direction: DataManager.shipDirection,
                tileMapNode: tileMapNode,
                characterNode: &characterNode,
                scale: scale)
        }
    }
}

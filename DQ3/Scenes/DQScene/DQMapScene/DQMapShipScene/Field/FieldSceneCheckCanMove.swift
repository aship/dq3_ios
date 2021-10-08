//
//  FieldSceneCheckCanMove.swift
//  DQ3
//
//  Created by aship on 2021/01/12.
//

import SpriteKit

extension FieldScene {
    func checkCanMove(tileMapNode: SKTileMapNode,
                      newPositionX: Int,
                      newPositionY: Int) -> Bool {
        if self.scene.fieldMoveMode == .walk {
            // 船がある場合は行ける
            if DataManager.adventureLog.hasShip {
                let shipNode = self.shipNode
                
                if shipNode?.positionX == newPositionX &&
                    shipNode?.positionY == newPositionY {
                    return true
                }
            }
            
            let tileGroup = tileMapNode.tileGroup(atColumn: newPositionX,
                                                  row: newPositionY)
            let name = tileGroup?.name
            
            if name == "tile0" ||
                name == "tile1" ||
                name == "tile2" ||
                name == "tile4" ||
                name == "tile6" ||
                name == "tile7" ||
                name == "tile12" ||
                name == "tile13" ||
                name == "tile14" ||
                name == "tile15" ||
                name == "tile16" ||
                name == "tile18" ||
                name == "tile19" ||
                name == "tile21" ||
                name == "tile22" ||
                name == "tile23" ||
                name == "tile24" ||
                name == "tile37" ||
                name == "tile39" ||
                name == "tile40" ||
                name == "tile42" ||
                name == "tile43" ||
                name == "tile44" {
                return false
            }
        }
        else if self.scene.fieldMoveMode == .ship {
            let tileGroup = tileMapNode.tileGroup(atColumn: newPositionX,
                                                  row: newPositionY)
            let name = tileGroup?.name
            
            if name == "tile16" ||
                name == "tile18" ||
                name == "tile40" {
                return false
            }
        }
        
        return true
    }
}

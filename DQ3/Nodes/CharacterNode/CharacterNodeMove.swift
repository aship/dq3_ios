//
//  CharacterNodeMove.swift
//  DQ3
//
//  Created by aship on 2020/12/25.
//

import SpriteKit

extension CharacterNode {
    func setMovePermitted() {
        self.isMovePermitted = true
    }
    
    func setMoveProhibited() {
        self.isMovePermitted = false
    }
    
    func move(direction: Direction,
              tileMapNode: SKTileMapNode,
              withMoveMap: Bool,
              scale: CGFloat,
              completion: @escaping () -> Void) {
        moveCharacter(direction: direction,
                      tileMapNode: tileMapNode,
                      scale: scale,
                      completion: {
                        completion()
                      })
        if !withMoveMap {
            return
        }
        
        // Head の場合のみ Map の逆移動が必要
        moveMap(direction: direction,
                tileMapNode: tileMapNode,
                scale: scale)
    }
    
    func moveCharacter(direction: Direction,
                       tileMapNode: SKTileMapNode,
                       scale: CGFloat,
                       completion: @escaping () -> Void) {
        let lengthStep = 16
        
        let diffs = getDiffXY(direction: direction)
        
        let diffX = diffs.0
        let diffY = diffs.1
        
        let moveX: CGFloat = CGFloat(diffX * lengthStep)
        let moveY: CGFloat = CGFloat(diffY * lengthStep)
        
        let actionHero = SKAction.moveBy(x: moveX,
                                         y: moveY,
                                         duration: 1 / 4)
        self.positionX += diffX
        self.positionY += diffY
        
        self.run(actionHero,
                 completion: {
                    completion()
                 }
        )
    }
    
    private func moveMap(direction: Direction,
                         tileMapNode: SKTileMapNode,
                         scale: CGFloat) {
        let lengthStep = 16 * scale
        
        let diffs = getDiffXY(direction: direction)
        
        let diffX = diffs.0
        let diffY = diffs.1
        
        let moveX: CGFloat = CGFloat(diffX) * lengthStep
        let moveY: CGFloat = CGFloat(diffY) * lengthStep
        
        // 地図は逆方向に動かす
        let action = SKAction.moveBy(x: -moveX,
                                     y: -moveY,
                                     duration: 1 / 4)
        tileMapNode.run(action)
    }
}

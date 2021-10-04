//
//  BaseMapSceneCharacterHeroMove.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension BaseMapScene {
    func setMovePermitted() {
        self.isMovePermitted = true
    }
    
    func setMoveProhibited() {
        self.isMovePermitted = false
    }
    
    func moveHero(direction: Direction,
                  tileMapNode: SKTileMapNode,
                  heroNode: SKSpriteNode,
                  scale: CGFloat,
                  newPositionX: Int,
                  newPositionY: Int) {
        var moveHeroX: CGFloat = 0
        var moveHeroY: CGFloat = 0
        var moveMapX: CGFloat = 0
        var moveMapY: CGFloat = 0
        
        let lengthStepHero: CGFloat = 16
        let lengthStepMap: CGFloat = 16 * scale
        
        if direction == .up {
            moveHeroX = 0
            moveHeroY = lengthStepHero
            
            moveMapX = 0
            moveMapY = -lengthStepMap
        }
        else if direction == .down {
            moveHeroX = 0
            moveHeroY = -lengthStepHero
            
            moveMapX = 0
            moveMapY = lengthStepMap
        }
        else if direction == .left {
            moveHeroX = -lengthStepHero
            moveHeroY = 0
            
            moveMapX = lengthStepMap
            moveMapY = 0
        }
        else if direction == .right {
            moveHeroX = lengthStepHero
            moveHeroY = 0
            
            moveMapX = -lengthStepMap
            moveMapY = 0
        }
        
        let actionHero = SKAction.moveBy(x: moveHeroX,
                                         y: moveHeroY,
                                         duration: 1 / 4)
        heroNode.run(actionHero,
                     completion: {
            self.isMoving = false
            self.checkPosition(newPositionX: newPositionX,
                               newPositionY: newPositionY)
        })
        
        let actionMap = SKAction.moveBy(x: moveMapX,
                                        y: moveMapY,
                                        duration: 1 / 4)
        tileMapNode.run(actionMap)
    }
    
    @objc func checkPosition(newPositionX: Int,
                             newPositionY: Int) {
    }
}

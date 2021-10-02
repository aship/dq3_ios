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
                     }
        )
        
        let actionMap = SKAction.moveBy(x: moveMapX,
                                        y: moveMapY,
                                        duration: 1 / 4)
        tileMapNode.run(actionMap,
                        completion: {})
        
        // 2人目以降をぞろぞろ動かす
        if 0 < self.queueFollowDirections.count {
            // 戦士
            let direction = self.queueFollowDirections.last
            
            let diffs = getDiffXY(direction: direction!)
            
            let diffX = diffs.0
            let diffY = diffs.1
            
            let moveX: CGFloat = CGFloat(diffX * 16)
            let moveY: CGFloat = CGFloat(diffY * 16)
            
            let action = SKAction.moveBy(x: moveX,
                                         y: moveY,
                                         duration: 1 / 4)
            self.warriorNode.run(action)
            
            if self.direction2nd != direction! {
                let action = getCharacterAnimationAction(direction: direction!,
                                                         dqCharacter: .warrior_female)
                self.warriorNode.run(action)
                
                self.direction2nd = direction!
            }
        }
        
        if 1 < self.queueFollowDirections.count {
            // 僧侶
            let indexLastMinusOne = self.queueFollowDirections.count - 2
            let direction = self.queueFollowDirections[indexLastMinusOne]
            
            let diffs = getDiffXY(direction: direction)
            
            let diffX = diffs.0
            let diffY = diffs.1
            
            let moveX: CGFloat = CGFloat(diffX * 16)
            let moveY: CGFloat = CGFloat(diffY * 16)
            
            let action = SKAction.moveBy(x: moveX,
                                         y: moveY,
                                         duration: 1 / 4)
            self.priestNode.run(action)
            
            if self.direction3rd != direction {
                let action = getCharacterAnimationAction(direction: direction,
                                                         dqCharacter: .priest_female)
                self.priestNode.run(action)
                
                self.direction3rd = direction
            }
        }
        
        if 2 < self.queueFollowDirections.count {
            // 魔法使い
            let indexLastMinusTwo = self.queueFollowDirections.count - 3
            let direction = self.queueFollowDirections[indexLastMinusTwo]
            
            let diffs = getDiffXY(direction: direction)
            
            let diffX = diffs.0
            let diffY = diffs.1
            
            let moveX: CGFloat = CGFloat(diffX * 16)
            let moveY: CGFloat = CGFloat(diffY * 16)
            
            let action = SKAction.moveBy(x: moveX,
                                         y: moveY,
                                         duration: 1 / 4)
            self.mageNode.run(action)
            
            if self.direction4th != direction {
                let action = getCharacterAnimationAction(direction: direction,
                                                         dqCharacter: .mage_female)
                self.mageNode.run(action)
                
                self.direction4th = direction
            }
        }
        
        if self.queueFollowDirections.count == 3 {
            self.queueFollowDirections.removeFirst()
        }
        
        // 2人目以降のために移動した方向をキューに保存
        self.queueFollowDirections.append(direction)
    }
    
    @objc func checkPosition(newPositionX: Int,
                             newPositionY: Int) {
    }
}

//
//  BattleCommandWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/05/19.
//

import SpriteKit

extension BattleCommandWindowNode {
    func moveTriangle(direction: Direction) {
        let battleScene = self.battleScene!
        let battleTargetWindowNode = battleScene.battleTargetWindowNode
        
        if battleTargetWindowNode.isOpen &&
            battleTargetWindowNode.isFocused {
            battleTargetWindowNode.moveTriangle(direction: direction)
            
            return
        }
        
        let battleSpellWindowNode = self.battleSpellWindowNode
        
        if battleSpellWindowNode.isOpen {
            battleSpellWindowNode.moveTriangle(direction: direction)
            
            return
        }
        
        if self.triangleMoving == true {
            return
        }
        
        if direction == .neutral {
            return
        }
        
        let isValidDirection = getNextElement(direction: direction,
                                              element: &self.dqBattleCommand,
                                              elements: self.dqBattleCommands)
        if !isValidDirection {
            return
        }
        
        let values = getDiffXY(direction: direction)
        let diffX: CGFloat = CGFloat(values.0 * 40)
        let diffY: CGFloat = CGFloat(values.1 * 16)
        
        self.triangleMoving = true
        
        let action = SKAction.moveBy(x: diffX,
                                     y: diffY,
                                     duration: 0)
        let waitAction = SKAction.wait(forDuration: 1 / 4)
        
        let sequence = SKAction.sequence([action,
                                          waitAction])
        self.triangleNode.run(sequence,
                              completion: {
                                self.triangleMoving = false
                              })
    }
}

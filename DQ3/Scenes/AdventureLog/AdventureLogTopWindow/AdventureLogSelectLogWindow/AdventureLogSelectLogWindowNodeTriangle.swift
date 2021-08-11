//
//  AdventureLogSelectLogWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/04/13.
//

import SpriteKit

extension AdventureLogSelectLogWindowNode {
    func moveTriangle(direction: Direction) {
        if self.dqAdventureLogTop == .change_message_speed {
            if let adventureLogMessageSpeedWindowNode = self.adventureLogMessageSpeedWindowNode {
                adventureLogMessageSpeedWindowNode.moveTriangle(direction: direction)
                
                return
            }
        }
        
        if self.dqAdventureLogTop == .delete {
            if let adventureLogYesNoDeleteLogWindowNode = self.adventureLogYesNoDeleteLogWindowNode {
                adventureLogYesNoDeleteLogWindowNode.moveTriangle(direction: direction)
                
                return
            }
        }
        
        if self.dqAdventureLogTop == .copy {
            if let adventureLogSelectEmptyLogWindowNode = self.adventureLogSelectEmptyLogWindowNode {
                adventureLogSelectEmptyLogWindowNode.moveTriangle(direction: direction)
                
                return
            }
        }
        
        if self.triangleMoving == true {
            return
        }
        
        if direction == .neutral {
            return
        }
        
        let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
        let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
        let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)
        
        let numberOfAdventureLogs = getNumberOfAdventureLogs(adventureLog1: adventureLog1,
                                                             adventureLog2: adventureLog2,
                                                             adventureLog3: adventureLog3)
        if self.triangleIndex == 0 {
            if numberOfAdventureLogs == 1 {
                return
            }
            
            if direction == .down {
                self.triangleIndex += 1
            }
            else {
                return
            }
        }
        else if self.triangleIndex == 1 {
            if direction == .up {
                self.triangleIndex -= 1
            }
            else if direction == .down {
                if 2 < numberOfAdventureLogs {
                    self.triangleIndex += 1
                }
                else {
                    return
                }
            }
            else {
                return
            }
        }
        else if self.triangleIndex == 2 {
            if direction == .up {
                self.triangleIndex -= 1
            }
            else {
                return
            }
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

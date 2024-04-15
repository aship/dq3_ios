//
//  BattleTargetWindowNodeTriangle.swift
//  DQ3
//
//  Created by aship on 2021/05/19.
//

import SpriteKit

extension BattleTargetWindowNode {
    func moveTriangle(direction: Direction) {
        //        if self.mapCommandZoomWindowNode.isOpen {
        //            self.mapCommandZoomWindowNode.moveTriangle(direction: direction)
        //
        //            return
        //        }

        if self.triangleMoving == true {
            return
        }

        if direction == .neutral {
            return
        }

        //    var selectBattleTargets: [DQMonsterType] = [.next_page]
        //   selectBattleTargets += self.selectableMonsterGroups

        let isValidDirection = getNextElement(
            direction: direction,
            element: &self.selectedMonsterGroup,
            elements: self.selectableMonsterGroups)
        if !isValidDirection {
            return
        }

        let values = getDiffXY(direction: direction)
        let diffX: CGFloat = CGFloat(values.0 * 40)
        let diffY: CGFloat = CGFloat(values.1 * 16)

        self.triangleMoving = true

        let action = SKAction.moveBy(
            x: diffX,
            y: diffY,
            duration: 0)
        let waitAction = SKAction.wait(forDuration: 1 / 4)

        let sequence = SKAction.sequence([
            action,
            waitAction,
        ])
        self.triangleNode.run(
            sequence,
            completion: {
                self.triangleMoving = false
            })
    }
    //
    //    private func getNextMonsterGroup(direction: Direction,
    //                                     monsterGroup: inout MonsterGroup,
    //                                     monsterGroups: [MonsterGroup]) -> Bool {
    //        let count = monsterGroups.count
    //        let index = monsterGroups.firstIndex(of: monsterGroup)
    //
    //        if direction == .left ||
    //            direction == .right {
    //            return false
    //        }
    //        else if direction == .up {
    //            if index == 0 {
    //                return false
    //            }
    //        }
    //        else if direction == .down {
    //            if index == count - 1 {
    //                return false
    //            }
    //        }
    //
    //        if direction == .up {
    //            monsterGroup = monsterGroups[index! - 1]
    //        }
    //        else if direction == .down {
    //            monsterGroup = monsterGroups[index! + 1]
    //        }
    //
    //        return true
    //    }
}

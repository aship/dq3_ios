//
//  Direction.swift
//  DQ3
//
//  Created by aship on 2021/01/05.
//

enum Direction: String {
    case neutral
    case up
    case down
    case right
    case left
}

func getDiffXY(direction: Direction) -> (Int, Int) {
    var diffX = 0
    var diffY = 0
    
    switch direction {
    case .up: diffY = 1
    case .down: diffY = -1
    case .left: diffX = -1
    case .right: diffX = 1
    case .neutral: break
    }
    
    return (diffX, diffY)
}

func getReverseDirection(direction: Direction) -> Direction {
    var reverseDirection: Direction = .neutral
    
    switch direction {
    case .up: reverseDirection = .down
    case .down: reverseDirection = .up
    case .left: reverseDirection = .right
    case .right: reverseDirection = .left
    case .neutral: break
    }
    
    return reverseDirection
}

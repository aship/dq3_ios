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

func getRandomDirection() -> Direction {
    let value = Int.random(in: 0...3)
    var direction: Direction!
    
    switch value {
    case 0: direction = .up
    case 1: direction = .down
    case 2: direction = .left
    case 3: direction = .right
    default: break
    }
    
    return direction
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

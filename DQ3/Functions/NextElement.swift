//
//  NextElement.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

func getNextElement<T: Equatable>(direction: Direction,
                                  element: inout T,
                                  elements: [T]) -> Bool {
    let count = elements.count
    let index = elements.firstIndex(of: element)
    
    if direction == .left ||
        direction == .right {
        return false
    }
    else if direction == .up {
        if index == 0 {
            return false
        }
    }
    else if direction == .down {
        if index == count - 1 {
            return false
        }
    }
    
    if direction == .up {
        element = elements[index! - 1]
    }
    else if direction == .down {
        element = elements[index! + 1]
    }
    
    return true
}

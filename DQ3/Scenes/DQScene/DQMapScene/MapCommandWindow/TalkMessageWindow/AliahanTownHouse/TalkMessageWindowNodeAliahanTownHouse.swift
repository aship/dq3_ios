//
//  TalkMessageWindowNodeAliahanTownhouse.swift
//  DQ3
//
//  Created by aship on 2021/01/27.
//

import SpriteKit

class TalkMessageWindowNodeAliahanTownHouse: BaseTalkMessageWindowNode {
    enum MotherMessageFlag {
        case none
        case message1
        case message2
        case message_two_finished
    }
    
    var motherMessageFlag: MotherMessageFlag = .none
}

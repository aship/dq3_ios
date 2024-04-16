//
//  TalkMessageWindowNodeAliahanTownHouseButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTownHouse {
    override func processButtonA() {
        switch self.name {
        case "mother": processMotherButtonA()
        case "grandfather": processGrandfatherButtonA()
        default: break
        }
    }
}

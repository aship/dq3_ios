//
//  TalkMessageWindowNodeAliahanTownButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/29.
//

import SpriteKit

extension TalkMessageWindowNodeAliahanTown {
    override func processButtonA() {        
        switch self.name {
        case "mother": processMotherButtonA()
        case "lady1": processLady1ButtonA()
        case "lady2": processLady2ButtonA()
        case "boy1": processBoy1ButtonA()
        case "boy2": processBoy2ButtonA()
        case "old_man1": processOldMan1ButtonA()
        case "old_man2": processOldMan2ButtonA(name: self.name!)
        case "warrior1": processWarrior1ButtonA()
        case "warrior2": processWarrior2ButtonA()
        case "warrior3": processWarrior3ButtonA()
        case "depository_talk": processDepositoryButtonA()
        case "tool_shop_talk": processToolShopButtonA()
        case "inn_talk": processInnButtonA()
        case "weapon_shop_talk": processWeaponShopButtonA()
        case "priest": processPriestButtonA()
        case "luida_talk": processLuidaButtonA()
        default: break
        }
    }
}

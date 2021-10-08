//
//  DQBattleCommand.swift
//  DQ3
//
//  Created by aship on 2021/05/28.
//

enum DQBattleCommand {
    case fight
    case spells
    case flee
    case items
    case defend
}

func getDQBattleCommandNameFrom(dqBattleCommand: DQBattleCommand) -> String {
    var name: String!
    
    switch dqBattleCommand {
    case .fight: name = "たたかう"
    case .spells: name = "じゅもん"
    case .flee: name = "にげる"
    case .items: name = "どうぐ"
    case .defend: name = "ぼうぎょ"
    }
    
    return name
}

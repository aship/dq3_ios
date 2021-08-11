//
//  AdventureLog.swift
//  DQ3
//
//  Created by aship on 2021/04/11.
//

import SpriteKit

class AdventureLog: NSObject,
                    NSCoding {
    var heroName: String = ""
    var messageSpeed = 4
    var partyCharacterNodes: [CharacterNode] = []
    
    // 保存するもの
    // 現在のキャラクター max 4人
    // ルイーダにいるキャラクター max ?人
    // ストーリー進行度
    
    override init() {
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.heroName, forKey: "heroName")
        coder.encode(self.messageSpeed, forKey: "messageSpeed")
        coder.encode(self.partyCharacterNodes, forKey: "partyCharacterNodes")
    }
    
    required init?(coder decoder: NSCoder) {
        self.heroName = decoder.decodeObject(forKey: "heroName") as! String
        self.messageSpeed = decoder.decodeInteger(forKey: "messageSpeed")
        self.partyCharacterNodes = decoder.decodeObject(forKey: "partyCharacterNodes") as! [CharacterNode]
    }
}

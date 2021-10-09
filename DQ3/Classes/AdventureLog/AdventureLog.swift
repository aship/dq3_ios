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
    var partyCharacterStatuses: [CharacterStatus] = []
    
    var dqSceneType: DQSceneType = .opening
    var dqStory: DQStory = .opening
    
    // 船/ラーミア所持
    var hasShip = false
    var hasRamia = false
    
    override init() {
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.dqSceneType.rawValue, forKey: "dqSceneType")
        coder.encode(self.dqStory.rawValue, forKey: "dqStory")
        
        coder.encode(self.hasShip, forKey: "hasShip")
        coder.encode(self.hasRamia, forKey: "hasRamia")
        
        coder.encode(self.heroName, forKey: "heroName")
        coder.encode(self.messageSpeed, forKey: "messageSpeed")
        
        coder.encode(self.partyCharacterNodes, forKey: "partyCharacterNodes")
        coder.encode(self.partyCharacterStatuses, forKey: "partyCharacterStatuses")
    }
    
    required init?(coder decoder: NSCoder) {
        self.dqSceneType = DQSceneType(rawValue: decoder.decodeObject(forKey: "dqSceneType") as! String)!
        self.dqStory = DQStory(rawValue: decoder.decodeInteger(forKey: "dqStory"))!
        
        self.hasShip = decoder.decodeBool(forKey: "hasShip")
        self.hasRamia = decoder.decodeBool(forKey: "hasRamia")
        
        self.heroName = decoder.decodeObject(forKey: "heroName") as! String
        self.messageSpeed = decoder.decodeInteger(forKey: "messageSpeed")
        
        self.partyCharacterNodes = decoder.decodeObject(forKey: "partyCharacterNodes") as! [CharacterNode]
        self.partyCharacterStatuses = decoder.decodeObject(forKey: "partyCharacterStatuses") as! [CharacterStatus]
    }
}

//
//  CharacterStatus.swift
//  DQ3
//
//  Created by aship on 2021/04/26.
//

import SpriteKit

class CharacterStatus: NSObject,
                       NSCoding {
    var dqVocation: DQVocation = .hero
    var dqGender: DQGender = .male
    
    var name = ""
    var hp = 100
    var hpMax = 000
    var mp = 100
    var mpMax = 100
    var level = 1
    
    override init() {
    }
    
    // mp, 最大mp, レベル、経験値、職業、性別
    // 装備(武器、よろい、たて、かぶと)
    // ちから、すばやさ、たいりょく、かしこさ、うんのよさ、こうげきりょく
    // しゅびりょく, 経験値
    // 持ってる道具
    // 覚えた呪文
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        
        aCoder.encode(self.dqVocation.rawValue, forKey: "dqVocation")
        aCoder.encode(self.dqGender.rawValue, forKey: "dqGender")
        
        aCoder.encode(self.hp, forKey: "hp")
        aCoder.encode(self.hpMax , forKey: "hpMax")
        aCoder.encode(self.mp, forKey: "mp")
        aCoder.encode(self.mpMax, forKey: "mpMax")
        aCoder.encode(self.level, forKey: "level")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        
        self.dqVocation = DQVocation(rawValue: aDecoder.decodeObject(forKey: "dqVocation") as! String)!
        self.dqGender = DQGender(rawValue: aDecoder.decodeObject(forKey: "dqGender") as! String)!
        
        self.hp = aDecoder.decodeInteger(forKey: "hp")
        self.hpMax = aDecoder.decodeInteger(forKey: "hpMax")
        self.mp = aDecoder.decodeInteger(forKey: "mp")
        self.mpMax = aDecoder.decodeInteger(forKey: "mpMax")
        self.level = aDecoder.decodeInteger(forKey: "level")
    }
}

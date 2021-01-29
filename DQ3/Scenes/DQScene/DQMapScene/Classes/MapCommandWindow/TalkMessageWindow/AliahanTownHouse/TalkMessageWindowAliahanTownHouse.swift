//
//  TalkMessageWindowAliahanTownhouse.swift
//  DQ3
//
//  Created by aship on 2021/01/27.
//

import SpriteKit

class TalkMessageWindowAliahanTownHouse: SKTileMapNode {
    enum MotherMessageFlag {
        case none
        case message1
        case message2
        case message_two_finished
    }
    
    var motherMessageFlag: MotherMessageFlag = .none
    
    var parentNode: MapCommandWindowNode!
    
    var arrLines: [[SKSpriteNode]] = []
    
    var nextMark: SKSpriteNode!
    
    var characterNpcNodes: [CharacterNode] = []
    
    init(characterNpcNodes: [CharacterNode]) {
        super.init()
        
        self.characterNpcNodes = characterNpcNodes
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

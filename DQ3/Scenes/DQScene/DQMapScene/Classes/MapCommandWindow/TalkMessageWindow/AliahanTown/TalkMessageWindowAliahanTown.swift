//
//  TalkMessageWindow.swift
//  DQ3
//
//  Created by aship on 2021/01/25.
//

import SpriteKit

class TalkMessageWindowAliahanTown: SKTileMapNode {
    enum Lady1MessageFlag {
        case none
        case message1
        case message2
    }
    
    enum OldMan1MessageFlag {
        case none
        case message1
        case message2
        case message3
    }
    
    enum OldMan2MessageFlag {
        case none
        case message1
        case message2
        case message3
    }
    
    var lady1MessageFlag: Lady1MessageFlag = .none
    var oldMan1MessageFlag: OldMan1MessageFlag = .none
    var oldMan2MessageFlag: OldMan2MessageFlag = .none
    
    var arrLines: [[SKSpriteNode]] = []
    
    var nextMark: SKSpriteNode!
    
    var parentNode: MapCommandWindowNode!
    
    var characterNpcNodes: [CharacterNode] = []
    
    init(characterNpcNodes: [CharacterNode]) {
        super.init()
        
        self.characterNpcNodes = characterNpcNodes
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

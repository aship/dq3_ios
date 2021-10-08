//
//  BaseTalkMessageWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/04/22.
//

import SpriteKit

class BaseTalkMessageWindowNode: MapMessageWindowNode {
    var characterNpcNodes: [CharacterNode] = []
    
    init(characterNpcNodes: [CharacterNode]) {
        super.init()
        
        self.characterNpcNodes = characterNpcNodes
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

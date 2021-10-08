//
//  CharacterNode.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import SpriteKit

class CharacterNode: SKSpriteNode {
    var dqCharacter: DQCharacter = .none
    var direction: Direction = .down
    
    var positionX: Int = 0
    var positionY: Int = 0
    
    var isTown: Bool!
    var isMoving = false
    var isMovePermitted = true
    
    init(dqCharacter: DQCharacter) {
        let size = CGSize(width: 16,
                          height: 16)
        
        super.init(texture: nil,
                   color: .clear,
                   size: size)
        
        self.dqCharacter = dqCharacter
    }
    
    func addToMap(tileMapNode: SKTileMapNode,
                  isTown: Bool) {
        self.isTown = isTown
        
        // 16 x 16 の左下(0, 0)が基準となる
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        // tileMap は anchorPoint が (0.5, 0.5) なので中心基準
        // つまりキャラの左下が map の中心と一致する位置に配置される
        tileMapNode.addChild(self)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.dqCharacter.rawValue, forKey: "dqCharacter")
        aCoder.encode(self.direction.rawValue, forKey: "direction")
        
        aCoder.encode(self.positionX, forKey: "positionX")
        aCoder.encode(self.positionY, forKey: "positionY")
    }
    
    required init?(coder aDecoder: NSCoder) {
        let size = CGSize(width: 16,
                          height: 16)
        
        super.init(texture: nil,
                   color: .clear,
                   size: size)
        
        self.dqCharacter = DQCharacter(rawValue: aDecoder.decodeObject(forKey: "dqCharacter") as! String)!
        self.direction = Direction(rawValue: aDecoder.decodeObject(forKey: "direction") as! String)!
        
        self.positionX = aDecoder.decodeInteger(forKey: "positionX")
        self.positionY = aDecoder.decodeInteger(forKey: "positionY")
    }
}

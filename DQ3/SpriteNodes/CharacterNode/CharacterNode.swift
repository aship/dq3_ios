//
//  CharacterNode.swift
//  DQ3
//
//  Created by aship on 2020/12/26.
//

import SpriteKit

class CharacterNode: SKSpriteNode {
    var dqCharacter: DQCharacter = .none
    var direction: Direction = .neutral
    
    var positionX: Int = 0
    var positionY: Int = 0
    
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToMap(tileMapNode: SKTileMapNode,
                  isTown: Bool) {
        // 左下基準
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        // 中心が 8 ドッド上にずれているためにの -8
        let pointX: CGFloat = 0
        var pointY: CGFloat = -8
        
        // 街とか城でははキャラは 4ドット 上に浮いてる
        if isTown {
            pointY += 4
        }
        
        self.position = CGPoint(x: pointX,
                                y: pointY)
        
        tileMapNode.addChild(self)
    }
}

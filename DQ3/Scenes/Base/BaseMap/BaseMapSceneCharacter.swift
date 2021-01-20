//
//  BaseSceneCharacter.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import SpriteKit

extension BaseMapScene {
    func addCharacter(node: SKSpriteNode,
                      tileMapNode: SKTileMapNode,
                      isTown: Bool) {
        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        // 中心が 8 ドッド上にずれているためにの -8
        let pointX: CGFloat = 0
        var pointY: CGFloat = -8
        
        // 街とか城でははキャラは 4ドット 上に浮いてる
        if isTown {
            pointY += 4
        }
        
        node.position = CGPoint(x: pointX, y: pointY)
        
        tileMapNode.addChild(node)
    }
    
    // キャラをタイルマップの右下(0, 0)に移動するための微調整
    // タイルマップの横のキャラ数が偶数、奇数かによって変わる
    // 図がないと説明しずらい
    func getMoveToOrigin(mapWidth: Int,
                         mapHeight: Int,
                         isNumberOfColumnsEven: Bool) -> (CGFloat, CGFloat) {
        let characterMoveX: CGFloat!
        let characterMoveY: CGFloat!
        
        if isNumberOfColumnsEven {
            characterMoveX = CGFloat(-mapWidth / 2)
        }
        else {
            characterMoveX = CGFloat(-mapWidth / 2) - 8
        }
        
        characterMoveY = CGFloat(-mapHeight / 2 + 8)
        
        return (characterMoveX, characterMoveY)
    }
    
    func getCharacterTexture(direction: Direction,
                             dqCharacter: DQCharacter) -> SKTexture {
        let dqVocation = DQVocation(rawValue: dqCharacter.rawValue)
        
        var type = "vocation"
        
        if dqVocation == nil {
            type = "npc"
        }
        
        let imagePath = "character/\(type)/\(dqCharacter.rawValue)"
        let imageName = "\(imagePath)/\(direction.rawValue)1.png"
        let texture = SKTexture(imageNamed: imageName)
        
        return texture
    }
}

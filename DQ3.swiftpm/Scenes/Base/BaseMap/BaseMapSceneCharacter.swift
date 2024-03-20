//
//  BaseSceneCharacter.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import SpriteKit

extension BaseMapScene {
    func addCharacter(
        node: SKSpriteNode,
        tileMapNode: SKTileMapNode,
        isTown: Bool
    ) {
        // 16 x 16 の左下(0, 0)が基準となる
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)

        // 横256ドット x 縦240 ドットのうち
        // キャラの中心点は、
        // キャラの左端が左から128ドットの位置にある必要がありこれは満たす
        // キャラの上下は 112ドットの空いている必要がある(つまり縦方向にはど真ん中)
        // これを補正するために 8 ドッド下にずらす
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
    internal func getMoveToOrigin(
        mapWidth: Int,
        mapHeight: Int
    ) -> (CGFloat, CGFloat) {
        let characterMoveX = CGFloat(-mapWidth / 2)
        let characterMoveY = CGFloat(-mapHeight / 2 + 8)

        return (characterMoveX, characterMoveY)
    }

    func getCharacterTexture(
        direction: Direction,
        dqCharacter: DQCharacter
    ) -> SKTexture {
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

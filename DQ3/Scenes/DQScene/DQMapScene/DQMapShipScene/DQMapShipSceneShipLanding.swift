//
//  FieldSceneShipLanding.swift
//  DQ3
//
//  Created by aship on 2021/04/23.
//

import SpriteKit

extension DQMapShipScene {
    func processLandingFromShip(characterNodes: inout [CharacterNode],
                                tileMapNode: SKTileMapNode,
                                scale: CGFloat) {
        self.scene.fieldMoveMode = .walk
        AudioManager.stop()
        
        let shipNode = characterNodes.first!
        
        // 船を配列から削除
        characterNodes.remove(at: 0)
        
        for node in characterNodes {
            node.isHidden = false
            node.positionX = shipNode.positionX
            node.positionY = shipNode.positionY
            node.changeDirection(direction: shipNode.direction)
            node.setPosition(tileMapNode: tileMapNode,
                             withMoveMap: false,
                             scale: scale)
        }
        
        AudioManager.play(dqAudio: .field)
    }
}

//
//  BattleSceneStatus.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addStatusWindow(
        battleStatusWindowNode: inout BattleStatusWindowNode,
        partyCharacterNodes: [CharacterNode],
        scene: BaseScene,
        scale: CGFloat
    ) {
        battleStatusWindowNode = BattleStatusWindowNode()
        battleStatusWindowNode.addToScene(
            scene: scene,
            partyCharacterNodes: partyCharacterNodes,
            scale: scale)
    }
}

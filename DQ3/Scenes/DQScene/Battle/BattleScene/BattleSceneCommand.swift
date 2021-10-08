//
//  BattleSceneCommand.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addCommandWindow(battleCommandWindowNode: inout BattleCommandWindowNode,
                          characterStatuses: [CharacterStatus],
                          index: Int,
                          scene: BaseScene,
                          scale: CGFloat) {
        let characterStatus = characterStatuses[index]
        
        battleCommandWindowNode = BattleCommandWindowNode(battleScene: self)
        battleCommandWindowNode.addToScene(scene: scene,
                                           scale: scale)
        battleCommandWindowNode.setName(name: characterStatus.name)
        battleCommandWindowNode.setCommand(dqVocation: characterStatus.dqVocation,
                                           index: index)
    }
}

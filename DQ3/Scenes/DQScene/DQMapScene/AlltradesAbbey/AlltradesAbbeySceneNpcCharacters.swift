//
//  AlltradesAbbeySceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

extension AlltradesAbbeyScene {
    func addNpcCharacters(tileMapNode: SKTileMapNode,
                          characterNpcNodes: inout [CharacterNode],
                          scale: CGFloat) {
        let isTown = true
        
        addNpcToMap(name: "minister",
                    dqCharacter: .minister,
                    positionX: AlltradesAbbeyMinisterPositionX,
                    positionY: AlltradesAbbeyMinisterPositionY,
                    direction: .down,
                    tileMapNode: tileMapNode,
                    isTown: isTown,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "mother",
                    dqCharacter: .lady,
                    positionX: AliahanTownHouseMotherPositionX,
                    positionY: AliahanTownHouseMotherPositionY,
                    direction: .down,
                    tileMapNode: tileMapNode,
                    isTown: isTown,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "grandfather",
                    dqCharacter: .old_man,
                    positionX: AliahanTownHouseOldManPositionX,
                    positionY: AliahanTownHouseOldManPositionY,
                    direction: AliahanTownHouseOldManDirection,
                    tileMapNode: tileMapNode,
                    isTown: isTown,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
    }
}

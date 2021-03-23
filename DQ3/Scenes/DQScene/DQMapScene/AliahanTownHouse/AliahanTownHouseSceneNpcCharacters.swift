//
//  AliahanTownHouseSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addNpcCharacters(tileMapNode: SKTileMapNode,
                          characterNpcNodes: inout [CharacterNode],
                          scale: CGFloat,
                          dqStory: DQStory) {
        let dqStory = DataManager.adventureLog.dqStory
        
        var direction: Direction!
        
        if dqStory == .opening {
            direction = .down
        }
        else {
            direction = .up
        }
        
        addNpcToMap(name: "mother",
                    dqCharacter: .lady,
                    positionX: AliahanTownHouseMotherPositionX,
                    positionY: AliahanTownHouseMotherPositionY,
                    direction: direction,
                    tileMapNode: tileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "grandfather",
                    dqCharacter: .old_man,
                    positionX: AliahanTownHouseOldManPositionX,
                    positionY: AliahanTownHouseOldManPositionY,
                    direction: AliahanTownHouseOldManDirection,
                    tileMapNode: tileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
    }
}

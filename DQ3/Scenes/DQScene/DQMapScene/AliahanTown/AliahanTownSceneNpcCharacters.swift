//
//  AliahanTownSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownScene {
    func addNpcCharacters(mainTileMapNode: SKTileMapNode,
                          insideTileMapNode: SKTileMapNode,
                          characterNpcNodes: inout [CharacterNode],
                          scale: CGFloat,
                          dqStory: DQStory) {
        if dqStory == .opening {
            addNpcToMap(name: "mother",
                        dqCharacter: .lady,
                        positionX: AliahanTownMotherStartPositionX,
                        positionY: AliahanTownMotherStartPositionY,
                        direction: AliahanTownMotherStartDirection,
                        tileMapNode: mainTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
            
            for node in characterNpcNodes {
                if node.name == "mother" {
                    // 母が消えてしまうのでオープニングだけ特殊処理
                    node.zPosition = ZPositionPartyHead
                }
            }
        }
        else if dqStory == .mother_waiting {
            addNpcToMap(name: "mother",
                        dqCharacter: .lady,
                        positionX: AliahanTownMotherWaitingPositionX,
                        positionY: AliahanTownMotherWaitingPositionY,
                        direction: AliahanTownMotherWaitingDirection,
                        tileMapNode: mainTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
        }
        
        addNpcToMap(name: "luida",
                    dqCharacter: .lady,
                    positionX: AliahanTownLuidaPositionX,
                    positionY: AliahanTownLuidaPositionY,
                    direction: AliahanTownLuidaDirection,
                    tileMapNode: insideTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcTalkToMap(name: "luida_talk",
                        positionX: AliahanTownLuidaTalkPositionX,
                        positionY: AliahanTownLuidaTalkPositionY,
                        tileMapNode: insideTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
        
        addNpcToMap(name: "lady1",
                    dqCharacter: .lady,
                    positionX: AliahanTownLady1PositionX,
                    positionY: AliahanTownLady1PositionY,
                    direction: AliahanTownLady1Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "lady2",
                    dqCharacter: .lady,
                    positionX: AliahanTownLady2PositionX,
                    positionY: AliahanTownLady2PositionY,
                    direction: AliahanTownLady2Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "boy1",
                    dqCharacter: .boy,
                    positionX: AliahanTownBoy1PositionX,
                    positionY: AliahanTownBoy1PositionY,
                    direction: AliahanTownBoy1Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "boy2",
                    dqCharacter: .boy,
                    positionX: AliahanTownBoy2PositionX,
                    positionY: AliahanTownBoy2PositionY,
                    direction: AliahanTownBoy2Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "old_man1",
                    dqCharacter: .old_man,
                    positionX: AliahanTownOldMan1PositionX,
                    positionY: AliahanTownOldMan1PositionY,
                    direction: AliahanTownOldMan1Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "old_man2",
                    dqCharacter: .old_man,
                    positionX: AliahanTownOldMan2PositionX,
                    positionY: AliahanTownOldMan2PositionY,
                    direction: AliahanTownOldMan2Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "warrior1",
                    dqCharacter: .npc_warrior,
                    positionX: AliahanTownWarrior1PositionX,
                    positionY: AliahanTownWarrior1PositionY,
                    direction: AliahanTownWarrior1Direction,
                    tileMapNode: insideTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "warrior2",
                    dqCharacter: .npc_warrior,
                    positionX: AliahanTownWarrior2PositionX,
                    positionY: AliahanTownWarrior2PositionY,
                    direction: AliahanTownWarrior2Direction,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "warrior3",
                    dqCharacter: .npc_warrior,
                    positionX: AliahanTownWarrior3PositionX,
                    positionY: AliahanTownWarrior3PositionY,
                    direction: AliahanTownWarrior3Direction,
                    tileMapNode: insideTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcToMap(name: "depository",
                    dqCharacter: .npc_marchant,
                    positionX: AliahanTownDepositoryPositionX,
                    positionY: AliahanTownDepositoryPositionY,
                    direction: AliahanTownDepositoryDirection,
                    tileMapNode: insideTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcTalkToMap(name: "depository_talk",
                        positionX: AliahanTownDepositoryTalkPositionX,
                        positionY: AliahanTownDepositoryTalkPositionY,
                        tileMapNode: insideTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
        
        addNpcToMap(name: "tool_shop",
                    dqCharacter: .npc_marchant,
                    positionX: AliahanTownToolShopPositionX,
                    positionY: AliahanTownToolShopPositionY,
                    direction: AliahanTownToolShopDirection,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcTalkToMap(name: "tool_shop_talk",
                        positionX: AliahanTownToolShopTalkPositionX,
                        positionY: AliahanTownToolShopTalkPositionY,
                        tileMapNode: mainTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
        
        addNpcToMap(name: "inn",
                    dqCharacter: .npc_marchant,
                    positionX: AliahanTownInnPositionX,
                    positionY: AliahanTownInnPositionY,
                    direction: AliahanTownInnDirection,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcTalkToMap(name: "inn_talk",
                        positionX: AliahanTownInnTalkPositionX,
                        positionY: AliahanTownInnTalkPositionY,
                        tileMapNode: mainTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
        
        addNpcToMap(name: "weapon_shop",
                    dqCharacter: .npc_marchant,
                    positionX: AliahanTownWeaponShopPositionX,
                    positionY: AliahanTownWeaponShopPositionY,
                    direction: AliahanTownWeaponShopDirection,
                    tileMapNode: mainTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
        
        addNpcTalkToMap(name: "weapon_shop_talk",
                        positionX: AliahanTownWeaponShopTalkPositionX,
                        positionY: AliahanTownWeaponShopTalkPositionY,
                        tileMapNode: mainTileMapNode,
                        characterNpcNodes: &characterNpcNodes,
                        scale: scale)
        
        addNpcToMap(name: "priest",
                    dqCharacter: .npc_priest,
                    positionX: AliahanTownPriestPositionX,
                    positionY: AliahanTownPriestPositionY,
                    direction: AliahanTownPriestDirection,
                    tileMapNode: insideTileMapNode,
                    characterNpcNodes: &characterNpcNodes,
                    scale: scale)
    }
}

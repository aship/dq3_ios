//
//  AliahanTownHouseScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addPartyCharacters(
        tileMapNode: SKTileMapNode,
        dqStory: DQStory,
        scale: CGFloat
    ) {
        var isHead: Bool!

        for (index, node) in DataManager.adventureLog.partyCharacterNodes.enumerated() {
            node.addToMap(
                tileMapNode: tileMapNode,
                isTown: true)

            if index == 0 {
                isHead = true
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/AliahanTownHouse/AliahanTownHouseScenePartyCharacters.swift
            } else {
                isHead = false
            }

            if DataManager.dqStory == .opening {
                node.setMoveProhibited()

========
                
                if dqStory == .opening {
                    node.setMoveProhibited()
                }
                else {
                    node.setMovePermitted()
                }
            }
            else {
                isHead = false
            }
            
            if dqStory == .opening {
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/AliahanTownHouse/AliahanTownHouseScenePartyCharacters.swift
                node.positionX = AliahanTownHouseMotherPositionX
                node.positionY = AliahanTownHouseMotherPositionY - 1

                node.texture = SKTexture(imageNamed: "character/vocation/hero/sleep")
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/AliahanTownHouse/AliahanTownHouseScenePartyCharacters.swift
            } else {
                node.setMovePermitted()

========
            }
            else {
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/AliahanTownHouse/AliahanTownHouseScenePartyCharacters.swift
                node.positionX = AliahanTownHouseStairsPositionX
                node.positionY = AliahanTownHouseStairsPositionY

                node.initDirection(direction: .right)
            }
<<<<<<<< HEAD:DQ3.swiftpm/Scenes/DQMapScene/AliahanTownHouse/AliahanTownHouseScenePartyCharacters.swift

            node.setPosition(
                tileMapNode: tileMapNode,
                withMoveMap: isHead,
                scale: scale)

            node.zPosition = CGFloat(4 - index)
========
            
            node.setPosition(tileMapNode: tileMapNode,
                             withMoveMap: isHead,
                             scale: scale)
            
            node.zPosition = ZPositionPartyHead - CGFloat(index)
>>>>>>>> aa4b000 (bumping version 0.6 using only one SKScene because of PS4 controller problem):DQ3/Scenes/DQScene/DQMapScene/AliahanTownHouse/AliahanTownHouseScenePartyCharacters.swift
        }
    }
}

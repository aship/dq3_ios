//
//  DQMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonA(mapCommandWindowNode: inout MapCommandWindowNode,
                        mapMessageWindowNode: MapMessageWindowNode,
                        characterNpcNodes: [CharacterNode],
                        adventureLog: AdventureLog,
                        scene: BaseScene) {
        if mapCommandWindowNode.isOpen {
            mapCommandWindowNode.processButtonA(adventureLog: adventureLog)
            
            return
        }
        
        SoundEffectManager.play(.command)
        
        let headNode = adventureLog.partyCharacterNodes.first!
        headNode.setMoveProhibited()
        
        let partyCharacterNodes = adventureLog.partyCharacterNodes
        
        for node in partyCharacterNodes {
            node.isPaused = true
        }
        
        for node in characterNpcNodes {
            node.isPaused = true
        }
        
        mapCommandWindowNode = MapCommandWindowNode(characterNpcNodes: characterNpcNodes)
        mapCommandWindowNode.addToScene(scene: scene,
                                        scale: scene.scale)
    }
}

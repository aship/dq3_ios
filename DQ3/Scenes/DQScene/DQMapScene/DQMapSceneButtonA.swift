
//  DQMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonA(mapCommandWindowNode: inout MapCommandWindowNode,
                        mapStatusWindowNode: inout MapStatusWindowNode,
                        mapMessageWindowNode: MapMessageWindowNode,
                        adventureLog: AdventureLog,
                        characterNpcNodes: [CharacterNode],
                        queueFollowDirections: inout [Direction],
                        tileMapNode: SKTileMapNode,
                        scene: BaseScene) {
        if mapCommandWindowNode.isOpen {
            mapCommandWindowNode.processButtonA(mapStatusWindowNode: mapStatusWindowNode,
                                                adventureLog: adventureLog)
            
            return
        }
        
        if mapMessageWindowNode.isOpen {
            mapMessageWindowNode.close()
            
            let headNode = adventureLog.partyCharacterNodes.first!
            headNode.setMovePermitted()
            
            return
        }
        
        if adventureLog.hasRamia &&
            adventureLog.dqSceneType == .field {
            let fieldScene = scene.fieldScene!
            
            fieldScene.processButtonARamia(
                mapCommandWindowNode: &mapCommandWindowNode,
                mapStatusWindowNode: &mapStatusWindowNode,
                characterNpcNodes: characterNpcNodes,
                partyCharacterNodes: &adventureLog.partyCharacterNodes,
                queueFollowDirections: &queueFollowDirections,
                tileMapNode: tileMapNode,
                scene: scene,
                scale: scene.scale)
            
            return
        }
        
        let partyCharacterNodes = adventureLog.partyCharacterNodes
        
        showCommandWindow(mapCommandWindowNode: &mapCommandWindowNode,
                          partyCharacterNodes: partyCharacterNodes,
                          characterNpcNodes: characterNpcNodes,
                          scene: scene,
                          scale: scene.scale)
        
        showStatusWindow(mapStatusWindowNode: &mapStatusWindowNode,
                         partyCharacterNodes: partyCharacterNodes,
                         scene: scene,
                         scale: scene.scale)
    }
    
    func showCommandWindow(mapCommandWindowNode: inout MapCommandWindowNode,
                           partyCharacterNodes: [CharacterNode],
                           characterNpcNodes: [CharacterNode],
                           scene: BaseScene,
                           scale: CGFloat) {
        SoundEffectManager.play(.command)
        
        let headNode = partyCharacterNodes.first!
        headNode.setMoveProhibited()
        
        for node in partyCharacterNodes {
            node.isPaused = true
        }
        
        for node in characterNpcNodes {
            node.isPaused = true
        }
        
        mapCommandWindowNode = MapCommandWindowNode(characterNpcNodes: characterNpcNodes)
        mapCommandWindowNode.addToScene(scene: scene,
                                        scale: scale)
    }
    
    func showStatusWindow(mapStatusWindowNode: inout MapStatusWindowNode,
                          partyCharacterNodes: [CharacterNode],
                          scene: BaseScene,
                          scale: CGFloat) {
        mapStatusWindowNode = MapStatusWindowNode()
        mapStatusWindowNode.addToScene(partyCharacterNodes: partyCharacterNodes,
                                       scene: scene,
                                       scale: scale)
    }
}

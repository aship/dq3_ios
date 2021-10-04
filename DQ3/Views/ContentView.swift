//
//  ContentView.swift
//  DQ3
//
//  Created by aship on 2020/12/08.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        let scene = TitleScene()
        
        let characterNode = CharacterNode(dqCharacter: .hero)
        
        let adventureLog = AdventureLog()
        adventureLog.heroName = "えにくす"
        adventureLog.partyCharacterNodes.append(characterNode)
        
        DataManager.adventureLog = adventureLog
        
        // let scene = AliahanTownScene()
        // for node in DataManager.adventureLog.partyCharacterNodes {
        //     node.positionX = AliahanTownEntrancePositionX
        //     node.positionY = AliahanTownEntrancePositionY
        // }
        
        // let scene = AliahanTownHouseScene()
        
        // let scene = FieldScene()
        // for node in DataManager.adventureLog.partyCharacterNodes {
        //     node.positionX = FieldAliahanPositionX
        //     node.positionY = FieldAliahanPositionY
        // }
        
        return Group {
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
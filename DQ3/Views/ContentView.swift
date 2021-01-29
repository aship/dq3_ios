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
        let scene = DataManager.scene
        
        if DebugWithParty {
            DataManager.characterNodes.append(CharacterNode(dqCharacter: .warrior_female))
            DataManager.characterNodes.append(CharacterNode(dqCharacter: .priest_female))
            DataManager.characterNodes.append(CharacterNode(dqCharacter: .mage_female))
        }
        
        if DataManager.dqSceneType == .field {
            for node in DataManager.characterNodes {
                node.positionX = FieldAliahanPositionX
                node.positionY = FieldAliahanPositionY
            }
        }
        else if DataManager.dqSceneType == .aliahan_town {
            for node in DataManager.characterNodes {
                node.positionX = AliahanTownEntrancePositionX
                node.positionY = AliahanTownEntrancePositionY
            }
        }
        
        return Group {
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

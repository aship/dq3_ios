//
//  ContentView.swift
//  DQ3
//
//  Created by aship on 2020/12/08.
//

import SpriteKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        let scene = DataManager.scene

        setDebugAdventureLog()

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

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
        
        // let scene = BaseMapScene()
        // if DataManager.dqSceneType == .aliahan_town {
        //     for node in DataManager.characterNodes {
        //         node.positionX = AliahanTownEntrancePositionX
        //         node.positionY = AliahanTownEntrancePositionY
        //     }
        // }
        // else if DataManager.dqSceneType == .field {
        //     for node in DataManager.characterNodes {
        //         node.positionX = FieldAliahanPositionX
        //         node.positionY = FieldAliahanPositionY
        //     }
        // }
        
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

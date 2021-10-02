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
        // let scene = AliahanTownScene()
        // let scene = AliahanTownHouseScene()
        // let scene = FieldScene()
        
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

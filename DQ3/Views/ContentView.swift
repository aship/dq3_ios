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
        
        return Group {
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

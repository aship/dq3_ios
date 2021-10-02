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
        
        if DebugSetCurrentMemory {
            setDebugCurrentMemory()
        }
        
        // debug optiion が有効な時は、
        // 強制的に冒険の書1を書き換え
        if DebugSetAdventureLog {
            if DebugSetAdventureLogEveryAppLaunch {
                setDebugAdventureLog()
            }
            else {
                let isSetAdventureLog = UserDefaultsUtil.loadDebugSetAdventureLogState()
                
                if !isSetAdventureLog {
                    // フラグセットされてないときのみ
                    // debug用冒険の書を書き込み
                    setDebugAdventureLog()
                    UserDefaultsUtil.saveDebugSetAdventureLogState(true)
                }
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

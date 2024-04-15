import SpriteKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        let scene = DataManager.scene

        setDebugAdventureLog()

        // debug optiion が有効な時は、
        // 強制的に冒険の書1を書き換え
        if DebugSetAdventureLog {
            if DebugSetAdventureLogEveryAppLaunch {
                setSpecialAdventureLog()
            } else {
                let isSetAdventureLog = UserDefaultsUtil.loadDebugSetAdventureLogState()

                if !isSetAdventureLog {
                    // フラグセットされてないときのみ
                    // debug用冒険の書を書き込み
                    setSpecialAdventureLog()
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

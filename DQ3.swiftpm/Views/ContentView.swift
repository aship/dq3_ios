import SpriteKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        let scene = TitleScene()

        return Group {
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

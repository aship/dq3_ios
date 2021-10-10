//
//  DQMapSceneNight.swift
//  DQ3
//
//  Created by aship on 2021/10/09.
//

import SpriteKit

extension DQMapScene {
    func addNightOverlay() {
        self.nightOverlayNode.size = CGSize(width: ScreenWidth,
                                           height: ScreenHeight)
        self.nightOverlayNode.color = .black
        self.nightOverlayNode.alpha = 0.6
        self.nightOverlayNode.zPosition = ZPositionNightOverlay
        self.scene.addChild(nightOverlayNode)
    }
    
    // 最初　朝？ ->
    // 33 歩で、明るくなった？昼？ ->
    // 34 でまた変わった？ 昼2 ->
    // 32 でまた？  夕方？ ->
    // 32 で暗くなった 夜 ->   都へロスは 32 x 4 の 128 歩？
    // 32 で真っ暗になった。
    // 32 でちょっと明るい夜になった。
    // 32 で朝？
    
    //  朝  昼 昼2 夕方 __ 夜 深夜　明方
    
    
    
    
}

//
//  MapCommandWindowNodeStatus.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension MapCommandWindowNode {
    internal func processStatusButtonA() {
        self.commandWindowStatus = .processing

        //        let text1 = "＊「えにくすは　もう"
        //        let text2 = "じゅうぶんに　つよい！"
        //
        //        self.mapMessageWindowNode = MapMessageWindowNode()
        //        self.mapMessageWindowNode?.showMessages(
        //            scene: self,
        //            text1: text1,
        //            text2: text2,
        //            text3: nil,
        //            withSe: false,
        //            withNextMark: false,
        //            pointX: MapMessageWindowChildOfCommandWindowPointX,
        //            pointY: MapMessageWindowChildOfCommandWindowPointY,
        //            scale: 1,
        //            completion: {
        //                self.commandWindowStatus = .should_close
        //            })
    }
}

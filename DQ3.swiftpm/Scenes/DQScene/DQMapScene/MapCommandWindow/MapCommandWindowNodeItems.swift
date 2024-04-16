//
//  MapCommandWindowNodeItems.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension MapCommandWindowNode {
    internal func processItemsButtonA() {
        self.commandWindowStatus = .processing

        //        let text1 = "どうぐを　もっていない。"
        //
        //        self.mapMessageWindowNode = MapMessageWindowNode()
        //        self.mapMessageWindowNode?.showMessages(
        //            scene: self,
        //            text1: text1,
        //            text2: nil,
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

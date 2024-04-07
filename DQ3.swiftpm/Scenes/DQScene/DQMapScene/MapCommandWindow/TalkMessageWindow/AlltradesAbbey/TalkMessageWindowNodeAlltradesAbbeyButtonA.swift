//
//  TalkMessageWindowNodeAlltradesAbbeyButtonA.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

extension TalkMessageWindowNodeAlltradesAbbey {
    override func processButtonA() {
        if self.alltradesAbbeyTalkMessageYesNoWindowNode.isOpen {
            self.alltradesAbbeyTalkMessageYesNoWindowNode.processButtonA()

            return
        }

        switch self.name {
        case "minister": processMinisterButtonA()
        default: break
        }
    }
}

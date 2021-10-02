//
//  TalkMessageWindowNodeAlltradesAbbey.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

class TalkMessageWindowNodeAlltradesAbbey: BaseTalkMessageWindowNode {
    enum MinisterMessageFlag {
        case none
        case message1
        case message2
        case message3
        case ask_going_now
    }
    
    var ministerMessageFlag: MinisterMessageFlag = .none
    
    var alltradesAbbeyTalkMessageYesNoWindowNode = AlltradesAbbeyTalkMessageYesNoWindowNode(name: "")
}

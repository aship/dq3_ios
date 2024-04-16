//
//  TalkMessageWindow.swift
//  DQ3
//
//  Created by aship on 2021/01/25.
//

import SpriteKit

class TalkMessageWindowNodeAliahanTown: BaseTalkMessageWindowNode {
    enum Lady1MessageFlag {
        case none
        case message1
        case message2
    }

    enum OldMan1MessageFlag {
        case none
        case message1
        case message2
        case message3
    }

    enum Warrior3MessageFlag {
        case none
        case message1
        case message2
    }

    enum LuidaMessageFlag {
        case none
        case message1
        case message2
        case message3
    }

    var lady1MessageFlag: Lady1MessageFlag = .none
    var oldMan1MessageFlag: OldMan1MessageFlag = .none
    var warrior3MessageFlag: Warrior3MessageFlag = .none
    var luidaMessageFlag: LuidaMessageFlag = .none

    var aliahanTownTalkMessageYesNoWindowNode = AliahanTownTalkMessageYesNoWindowNode(name: "")

    var talkMessageLuidaWishWindowNode = TalkMessageLuidaWishWindowNode()
}

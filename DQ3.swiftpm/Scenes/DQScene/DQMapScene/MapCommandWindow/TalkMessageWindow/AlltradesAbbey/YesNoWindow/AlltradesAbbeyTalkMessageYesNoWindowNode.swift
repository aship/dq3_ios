//
//  AlltradesAbbeyTalkMessageYesNoWindowNode.swift
//  DQ3
//
//  Created by aship on 2021/05/13.
//

import SpriteKit

class AlltradesAbbeyTalkMessageYesNoWindowNode: BaseYesNoWindowNode {
    func processButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)

        let parentNode = self.parent as! TalkMessageWindowNodeAlltradesAbbey

        self.close()

        if self.name == "minister" {
            if parentNode.ministerMessageFlag == .message3 {
                if self.dqYesNo == .yes {
                    // 冒険の書にセーブ
                    //     DataManager.saveAdventureLog()

                    let text1 = "*「しかと きろくしたぞよ。"

                    Task {
                        await parentNode.showMessage(
                            string: text1,
                            line: 3,
                            withSe: true)
                        parentNode.moveLine()
                        parentNode.showNextMark(line: 3)

                        let parentParent = parentNode.parent as! MapCommandWindowNode
                        parentParent.commandWindowStatus = .prompt

                        parentNode.ministerMessageFlag = .ask_going_now
                    }
                } else if self.dqYesNo == .no {
                    parentNode.ministerMessageFlag = .ask_going_now

                    showAskGoingNow(windowNode: parentNode)
                }

                return
            }

            if parentNode.ministerMessageFlag == .ask_going_now {
                if self.dqYesNo == .yes {
                    let text1 = "*「では ゆくがよい!"
                    let text2 = "  えにくすよ!"

                    Task {
                        await parentNode.showMessage(
                            string: text1,
                            line: 3,
                            withSe: true)

                        parentNode.moveLine()

                        await parentNode.showMessage(
                            string: text2,
                            line: 3,
                            withSe: true)

                        parentNode.moveLine()

                        let parentParent = parentNode.parent as! MapCommandWindowNode
                        parentParent.commandWindowStatus = .should_close
                    }
                } else if self.dqYesNo == .no {
                    let text1 = "*「では しばし やすむがよい!"
                    let text2 = "  また あおう! えにくすよ!"

                    Task {
                        await parentNode.showMessage(
                            string: text1,
                            line: 3,
                            withSe: true)
                        parentNode.moveLine()

                        await parentNode.showMessage(
                            string: text2,
                            line: 3,
                            withSe: true)
                        parentNode.moveLine()

                        let parentParent = parentNode.parent as! MapCommandWindowNode
                        parentParent.commandWindowStatus = .should_close
                    }
                }
            }
        }
    }
}

func showAskGoingNow(windowNode: TalkMessageWindowNodeAlltradesAbbey) {
    windowNode.nextMark.removeFromParent()

    let text1 = "*「どうじゃ? また すぐに"
    let text2 = "  たびだつ つもりか?"

    //  let parent = windowNode.parent as! MapCommandWindowNode

    Task {
        await windowNode.showMessage(
            string: text1,
            line: 3,
            withSe: true)
        await windowNode.moveLine()

        await windowNode.showMessage(
            string: text2,
            line: 3,
            withSe: true)
        await windowNode.moveLine()

        //        parent.commandWindowStatus = .prompt
        //
        //        windowNode.alltradesAbbeyTalkMessageYesNoWindowNode = AlltradesAbbeyTalkMessageYesNoWindowNode(name: windowNode.name!)
        //        windowNode.alltradesAbbeyTalkMessageYesNoWindowNode.addToWindow(windowNode: windowNode)
    }
}

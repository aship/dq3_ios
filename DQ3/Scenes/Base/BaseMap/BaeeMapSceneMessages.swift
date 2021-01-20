//
//  BaeeMapSceneMessages.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension BaseMapScene {
    func showMessages(text1: String,
                      text2: String?,
                      text3: String?,
                      withSe: Bool,
                      withNextMark: Bool,
                      messageWindowNode: inout SKTileMapNode,
                      isMessageWindowOpen: inout Bool,
                      scale: CGFloat,
                      completion: @escaping () -> Void) {
        addMessageWindow(messageWindowNode: &messageWindowNode,
                         isMessageWindowOpen: &isMessageWindowOpen,
                         scale: scale)
        
        showMessage(string: text1,
                    line: 0,
                    withSe: withSe,
                    messageWindowNode: messageWindowNode,
                    completion: {
                        if text2 == nil {
                            if withNextMark {
                                self.showNextMark(line: 1,
                                                  messageWindowNode: self.messageWindowNode,
                                                  completion: {
                                                    completion()
                                                  })
                            }
                            else {
                                completion()
                            }
                        }
                        else {
                            self.showMessage(string: text2!,
                                             line: 1,
                                             withSe: withSe,
                                             messageWindowNode: self.messageWindowNode,
                                             completion: {
                                                if text3 == nil {
                                                    if withNextMark {
                                                        self.showNextMark(line: 2,
                                                                          messageWindowNode: self.messageWindowNode,
                                                                          completion: {
                                                                            completion()
                                                                          })
                                                    }
                                                    else {
                                                        completion()
                                                    }
                                                }
                                                else {
                                                    self.showMessage(string: text3!,
                                                                     line: 2,
                                                                     withSe: withSe,
                                                                     messageWindowNode: self.messageWindowNode,
                                                                     completion: {
                                                                        if withNextMark {
                                                                            self.showNextMark(line: 3,
                                                                                              messageWindowNode: self.messageWindowNode,
                                                                                              completion: {
                                                                                                completion()
                                                                                              })
                                                                        }
                                                                        else {
                                                                            completion()
                                                                        }
                                                                     })
                                                }
                                             })
                        }
                    })
    }
}

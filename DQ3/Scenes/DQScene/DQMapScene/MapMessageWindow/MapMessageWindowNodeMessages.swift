//
//  MapMessageWindowNodeMessages.swift
//  DQ3
//
//  Created by aship on 2021/01/21.
//

import SpriteKit

extension MapMessageWindowNode {
    func showMessages(text1: String,
                      text2: String?,
                      text3: String?,
                      withSe: Bool,
                      withNextMark: Bool,
                      completion: @escaping () -> Void) {
        Task {
            await showMessage(string: text1,
                              line: 0,
                              withSe: withSe)
            
            if text2 == nil {
                if withNextMark {
                    self.showNextMark(line: 1)
                }
                completion()
            }
            else {
                await showMessage(string: text2!,
                                  line: 1,
                                  withSe: withSe)
                
                if text3 == nil {
                    if withNextMark {
                        self.showNextMark(line: 2)
                    }
                    
                    completion()
                }
                else {
                    await showMessage(string: text3!,
                                      line: 2,
                                      withSe: withSe)
                    if withNextMark {
                        self.showNextMark(line: 3)
                    }
                    
                    completion()
                }
            }
        }
    }
}

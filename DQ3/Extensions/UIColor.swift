//
//  UIColor.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SwiftUI

extension UIColor {
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: alpha)
    }
}

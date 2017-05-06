//
//  UIColor-Extension.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 05/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation
import UIKit

// Source http://stackoverflow.com/a/33397427/2984775

public extension UIColor {
    ///   Create an UIColor object based on a hex string
    ///
    /// - Parameter hexString: a hex string describing a color
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

    /// Method that returns an UIColor in a hex string
    ///
    /// - Returns: UIColor hex String
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return NSString(format:"#%06x", rgb) as String
    }
}

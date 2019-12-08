//
//  UIColor+Extend.swift
//  Contacts
//
//  Created by Tuhin S on 07/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid RED")
        assert(green >= 0 && green <= 255, "Invalid GREEN")
        assert(blue >= 0 && blue <= 255, "Invalid BLUE")
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    convenience init(hexValue: Int) {
        self.init(
            red: (hexValue >> 16) & 0xFF,
            green: (hexValue >> 8) & 0xFF,
            blue: hexValue & 0xFF
        )}
    static let titleTextColor: UIColor = UIColor(hexValue: ColorHexCodes.textColor)
    static let placeholderColor: UIColor = UIColor(hexValue: ColorHexCodes.textColor).withAlphaComponent(0.5)
}

private struct ColorHexCodes {
    private init() {}
    static let textColor: Int = 0x4A4A4A
}

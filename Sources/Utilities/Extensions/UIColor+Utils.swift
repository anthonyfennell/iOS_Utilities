//
//  UIColor+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension UIColor {
    public convenience init(hex: Int) {
        let red = CGFloat(hex >> 16) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    public convenience init(rgba: UInt) {
        let red = CGFloat(rgba >> 24) / 255.0
        let green = CGFloat((rgba >> 16) & 0xFF) / 255.0
        let blue = CGFloat((rgba >> 8) & 0xFF) / 255.0
        let alpha = CGFloat(rgba & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

//
//  UIToolbar+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension UIToolbar {
    static func makeToolbar(barColor: UIColor, tintColor: UIColor) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barTintColor = barColor
        toolbar.tintColor = tintColor
        toolbar.sizeToFit()
        return toolbar
    }
}

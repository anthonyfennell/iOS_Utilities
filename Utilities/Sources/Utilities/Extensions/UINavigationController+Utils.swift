//
//  UINavigationController+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension UINavigationController {
    func set(barColor: UIColor, textColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = barColor
        appearance.largeTitleTextAttributes = [.foregroundColor: textColor as Any]
        appearance.titleTextAttributes = [.foregroundColor: textColor as Any]
        appearance.shadowColor = .clear
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = barColor
        self.navigationBar.titleTextAttributes = [.foregroundColor: textColor as Any]
        self.navigationBar.tintColor = textColor
    }
}

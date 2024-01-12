//
//  UIDevice+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension UIDevice {
    class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
}

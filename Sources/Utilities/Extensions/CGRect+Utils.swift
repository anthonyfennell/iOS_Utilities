//
//  CGRect+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension CGRect {
    func centeredY(for height: CGFloat) -> CGRect {
        var rect = self
        rect.origin.y = rect.minY + (rect.height - height) / 2.0
        return rect
    }
    
    func centeredX(for width: CGFloat) -> CGRect {
        var rect = self
        rect.origin.x = rect.minX + (rect.width - width) / 2.0
        return rect
    }
    
    func centeredYRightAlignedX(for size: CGSize) -> CGRect {
        var rect = self
        rect.origin.y = rect.minY + (rect.height - size.height) / 2.0
        rect.origin.x = rect.maxX - size.width
        return rect
    }
    
    func rightAlignedX(for width: CGFloat) -> CGRect {
        var rect = self
        rect.origin.x = rect.maxX - width
        return rect
    }
}

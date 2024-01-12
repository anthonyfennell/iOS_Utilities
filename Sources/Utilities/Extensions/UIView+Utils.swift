//
//  UIView+Utils.swift
//
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension UIView {
    public static func loadFromNib<T>(nibName: String? = nil) -> T {
        let nibName = nibName != nil ? nibName! : String(describing: self)
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        return nib.instantiate(withOwner: self, options: nil)[0] as! T
    }
    
    // MARK: - Animation
    public func fadeOutIn(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    public func transitionFromLeft(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeOut)
        animation.type = CATransitionType.moveIn
        animation.subtype = CATransitionSubtype.fromLeft
        animation.duration = duration
        layer.add(animation, forKey: CATransitionSubtype.fromLeft.rawValue)
    }
    
    public func transitionFromRight(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeOut)
        animation.type = CATransitionType.moveIn
        animation.subtype = CATransitionSubtype.fromRight
        animation.duration = duration
        layer.add(animation, forKey: CATransitionSubtype.fromRight.rawValue)
    }
}

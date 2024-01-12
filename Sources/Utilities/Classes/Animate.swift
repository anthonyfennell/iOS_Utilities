//
//  Animate.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

struct Animate {
    
    // MARK: - Rotate at 45 degrees
    static func rotate360(squareView: UIView, anchorPoint: CGPoint, xAxis: CGFloat, yAxis: CGFloat, fromValue: CGFloat = 0, duration: CFTimeInterval = 4.0) {
        let transform = CATransform3DRotate(squareView.layer.transform, fromValue, xAxis, yAxis, 0)
        let values: [CATransform3D] = [
            CATransform3DRotate(transform, fromValue, xAxis, yAxis, 0),
            CATransform3DRotate(transform, fromValue + .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, fromValue + .pi, xAxis, yAxis, 0),
            CATransform3DRotate(transform, fromValue + 3 * .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, fromValue + 2 * .pi, xAxis, yAxis, 0)
        ]
        squareView.layer.anchorPoint = anchorPoint
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = duration
        animation.repeatCount = MAXFLOAT
        animation.values = values
        squareView.layer.add(animation, forKey: "tranformME")
    }
    
    static func rotate180AndBack(squareView: UIView, anchorPoint: CGPoint, xAxis: CGFloat, yAxis: CGFloat, duration: CFTimeInterval = 4.0) {
        let transform = squareView.layer.transform
        let values: [CATransform3D] = [
            CATransform3DRotate(transform, 0, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi, xAxis, yAxis, 0),
            CATransform3DRotate(transform, .pi / 2, xAxis, yAxis, 0),
            CATransform3DRotate(transform, 0, xAxis, yAxis, 0)
        ]
        squareView.layer.anchorPoint = anchorPoint
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = duration
        animation.repeatCount = MAXFLOAT
        animation.values = values
        squareView.layer.add(animation, forKey: "tranformME")
    }
    
    static func hopUp(view: UIView, distance: CGFloat, completion: ((Bool) -> Void)?) {
        let damping: CGFloat = 0.5 * distance / view.frame.height
        let velocity: CGFloat = 2 * distance / view.frame.height
        let duration: CGFloat = 0.3 //* distance / view.frame.height
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.05, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [], animations: {
            view.transform = CGAffineTransform(translationX: 0, y: -distance)
        }, completion: completion)
    }
    
    static func hopDown(view: UIView, distance: CGFloat, completion: ((Bool) -> Void)?) {
        let damping: CGFloat = 0.5 * distance / view.frame.height
        let velocity: CGFloat = 2 * distance / view.frame.height
        let duration: CGFloat = 0.3 //* distance / view.frame.height
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.05, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [], animations: {
            view.transform = CGAffineTransform(translationX: 0, y: distance)
        }, completion: completion)
    }
}

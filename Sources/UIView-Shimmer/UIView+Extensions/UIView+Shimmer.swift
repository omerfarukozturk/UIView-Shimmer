//
//  UIView+Shimmer.swift
//  UIView-Shimmer
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import UIKit

extension UIView {
    
    /// Set shimmering animation for view..
    /// - Parameters:
    ///     - animated: Specifies the animation is on/off.
    ///     - superviewBackgroundColor: The `backgroudColor` of specified views superview.
    public func setShimmeringAnimation(_ animated: Bool, superviewBackgroundColor: UIColor? = nil) {
        let currentShimmerLayer = layer.sublayers?.first(where: { $0.name == Key.shimmer })
        if animated {
            if currentShimmerLayer != nil { return }
        } else {
            currentShimmerLayer?.removeFromSuperlayer()
            return
        }
        
        let baseShimmeringColor: UIColor? = superviewBackgroundColor ?? superview?.backgroundColor
        guard let color = baseShimmeringColor else {
            print("`baseColor` can not be nil while calling `setShimmeringAnimation`")
            return
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = Key.shimmer
        var frame: CGRect!
        if self is UILabel {
            let width: CGFloat = max(intrinsicContentSize.width, sizeThatFits(bounds.size).width)
            frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: width, height: bounds.height)
        } else {
           frame = bounds
        }
        gradientLayer.frame = frame
        gradientLayer.cornerRadius = min(bounds.height / 2, 5)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let gradientColorOne = color.withAlphaComponent(0.5).cgColor
        let gradientColorTwo = color.withAlphaComponent(0.8).cgColor
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        layer.addSublayer(gradientLayer)
        gradientLayer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        
        // shimmer animation
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 1.25
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
}

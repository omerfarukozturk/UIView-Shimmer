//
//  UIView+Template.swift
//  UIView-Shimmer
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import UIKit

extension UIView {
    
    public func setTemplate(_ isTemplate: Bool, baseColor: UIColor? = nil) {
        var color: UIColor
        if let baseColor = baseColor {
            color = baseColor
        } else {
            if #available(iOS 12, *), traitCollection.userInterfaceStyle == .dark {
                color = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
            } else {
                color = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
            }
        }
        let currentTemplateLayer = layer.sublayers?.first(where: { $0.name == Key.template })
        
        if isTemplate {
            if currentTemplateLayer != nil { return }
        } else {
            currentTemplateLayer?.removeFromSuperlayer()
            layer.mask = nil
            return
        }
        
        let templateLayer = CALayer()
        templateLayer.name = Key.template
        var templateFrame: CGRect!
        
        setNeedsLayout()
        layoutIfNeeded()
        
        if let label = self as? UILabel {
            let width: CGFloat = intrinsicContentSize.width
            var horizontalX: CGFloat!
            switch label.textAlignment {
            case .center:
                horizontalX = bounds.midX - width / 2
            case .right:
                horizontalX = bounds.width - width
            default:
                horizontalX = 0
            }
            
            templateFrame = CGRect(x: horizontalX, y: 0, width: width, height: bounds.height)
        } else {
            templateFrame = bounds
        }
        
        let cornerRadius: CGFloat = max(layer.cornerRadius, min(bounds.height/2,5))
        
        let maskLayer = CAShapeLayer()
        let ovalPath = UIBezierPath(roundedRect: templateFrame, cornerRadius: cornerRadius)
        maskLayer.path = ovalPath.cgPath
        layer.mask = maskLayer
        
        templateLayer.frame = templateFrame
        templateLayer.cornerRadius = cornerRadius
        templateLayer.backgroundColor = color.cgColor
        layer.addSublayer(templateLayer)
        templateLayer.zPosition = CGFloat(Float.greatestFiniteMagnitude - 1.0)
    }
    
}

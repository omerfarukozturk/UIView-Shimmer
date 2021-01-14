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
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let templateFrame = getFrame()
        let cornerRadius: CGFloat = max(layer.cornerRadius, min(bounds.height/2,5))
        
        // MARK: - Mask Layer
        let maskLayer = CAShapeLayer()
        let ovalPath = UIBezierPath(roundedRect: templateFrame, cornerRadius: cornerRadius)
        maskLayer.path = ovalPath.cgPath
        layer.mask = maskLayer
        
        // MARK: Template Layer
        templateLayer.frame = templateFrame
        templateLayer.cornerRadius = cornerRadius
        templateLayer.backgroundColor = color.cgColor
        layer.addSublayer(templateLayer)
        templateLayer.zPosition = CGFloat(Float.greatestFiniteMagnitude - 1.0)
    }
    
}

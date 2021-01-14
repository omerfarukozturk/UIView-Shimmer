//
//  UIView+Extensions.swift
//  UIView-Shimmer
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import UIKit

public protocol ShimmeringViewProtocol where Self: UIView {
    var shimmeringAnimatedItems: [UIView] { get }
}

extension ShimmeringViewProtocol {
    public var shimmeringAnimatedItems: [UIView] { [self] }
}

extension UIView {
    
    var allTemplateViews: [UIView] {
        var views = [UIView]()
        getSubShimmerViews(&views)
        return views
    }
    
    private func getSubShimmerViews(_ views: inout [UIView]) {
        if let view = self as? ShimmeringViewProtocol {
            views.append(contentsOf: view.shimmeringAnimatedItems)
        }
        subviews.forEach { $0.getSubShimmerViews(&views) }
    }
    
    public func setShimmeringAnimationWithSubviews(template: Bool, superviewBackgroundColor: UIColor? = nil) {
        allTemplateViews.forEach {
            $0.setTemplate(template)
            $0.setShimmeringAnimation(template, superviewBackgroundColor: superviewBackgroundColor)
        }
    }
    
    func getFrame() -> CGRect {
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
            
            return CGRect(x: horizontalX, y: 0, width: width, height: bounds.height)
        } else {
            return bounds
        }
    }
}

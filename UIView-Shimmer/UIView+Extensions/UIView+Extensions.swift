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
    
    public func setShimmeringAnimationWithSubviews(template: Bool, color: UIColor? = nil) {
        allTemplateViews.forEach {
            $0.setTemplate(template)
            $0.setShimmeringAnimation(template, baseColor: color)
        }
    }
}

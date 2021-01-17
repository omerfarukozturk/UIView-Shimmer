//
//  UIView+Extensions.swift
//  UIView-Shimmer
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import UIKit

extension UIView {
    
    var allTemplateViews: [UIView] {
        var views = [UIView]()
        getSubShimmerViews(&views)
        return views
    }
    
    private func getSubShimmerViews(_ views: inout [UIView], excludedViews: Set<UIView> = []) {
        var excludedViews = excludedViews
        if let view = self as? ShimmeringViewProtocol {
            excludedViews = excludedViews.union(view.excludedItems)
            views.append(contentsOf: view.shimmeringAnimatedItems.filter({ !excludedViews.contains($0) }))
        }
        subviews.forEach { $0.getSubShimmerViews(&views, excludedViews: excludedViews) }
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
            
            return CGRect(x: horizontalX, y: 0, width: width, height: intrinsicContentSize.height)
        }
        
        return bounds
    }
}

// MARK: Public Extensions

extension UIView {
    
    
    /// Sets the view as template with shimmering animation.
    /// - Parameters:
    ///   - template: Boolean value determines seting the view template or not.
    ///   - color: Optional template effect color.
    ///   - animate: Apply shimmering effect or not. Default value is `true`
    ///   - viewBackgroundColor: Color for shimmering animation to adapt superview. If not specified, `superview?.backgroundColor` is used.
    public func setTemplateWithSubviews(_ template: Bool,
                                        color: UIColor? = nil,
                                        animate: Bool = true,
                                        viewBackgroundColor: UIColor? = nil) {
        allTemplateViews.forEach {
            $0.setTemplate(template, baseColor: color)
            if animate {
                $0.setShimmeringAnimation(template, viewBackgroundColor: viewBackgroundColor)
            }
        }
    }
}

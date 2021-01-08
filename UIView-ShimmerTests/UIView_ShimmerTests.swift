//
//  UIView_ShimmerTests.swift
//  UIView-ShimmerTests
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import XCTest
@testable import UIView_Shimmer

final class UIView_ShimmerTests: XCTestCase {

    func testAllTemplateViewsReturnRelatedViewsInView() {
        // Given
        let mainView = UIView()
        let view1 = ACustomView()
        mainView.addSubview(view1)
        let view2 = ACustomView()
        mainView.addSubview(view2)
        
        let aButton = UIButton()
        let aLabel = UILabel()
        let stackView = UIStackView(arrangedSubviews: [aButton, aLabel])
        mainView.addSubview(stackView)
        
        // When
        let expectedViews = mainView.allTemplateViews
        
        // Then
        XCTAssertEqual([view1, view2, aButton, aLabel], expectedViews)
    }
    
    func testSetShimmeringAnimationWithSubviewsAddsAndRemovesSubLayers() {
        // Given
        let aButton = UIButton()
        let aLabel = UILabel()
        let stackView = UIStackView(arrangedSubviews: [aButton, aLabel])
        
        // When
        stackView.setShimmeringAnimationWithSubviews(template: true, color: .white)
        
        // Then
        XCTAssertNotNil(aButton.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNotNil(aButton.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        XCTAssertNotNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNotNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        
        // When
        stackView.setShimmeringAnimationWithSubviews(template: false)

        // Then
        XCTAssertNil(aButton.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNil(aButton.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        XCTAssertNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
    }
}

fileprivate final class ACustomView: UIView, ShimmeringViewProtocol { }

extension UIButton: ShimmeringViewProtocol { }

extension UILabel: ShimmeringViewProtocol { }

//
//  UIView_ShimmerTests.swift
//  UIView-ShimmerTests
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import XCTest
@testable import UIView_Shimmer

extension UIButton: ShimmeringViewProtocol { }
extension UILabel: ShimmeringViewProtocol { }

final class UIView_ShimmerTests: XCTestCase {

    func testSetShimmeringAnimationWithSubviewsAddsAndRemovesSubLayers() {
        // Given
        let aButton = UIButton()
        let aLabel = UILabel()
        let stackView = UIStackView(arrangedSubviews: [aButton, aLabel])
        
        // When
        stackView.setTemplateWithSubviews(true, viewBackgroundColor: .white)
        
        // Then
        XCTAssertNotNil(aButton.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNotNil(aButton.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        XCTAssertNotNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNotNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        
        // When
        stackView.setTemplateWithSubviews(false)

        // Then
        XCTAssertNil(aButton.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNil(aButton.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        XCTAssertNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
    }
    
    func testSetTemplageWithSubviewsAddPlaceholderButShimmer() {
        // Given
        let aButton = UIButton()
        let aLabel = UILabel()
        let stackView = UIStackView(arrangedSubviews: [aButton, aLabel])
        
        // When
        stackView.setTemplateWithSubviews(true)
        
        // Then
        XCTAssertNotNil(aButton.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNil(aButton.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
        XCTAssertNotNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.template }))
        XCTAssertNil(aLabel.layer.sublayers?.first(where: { $0.name == Key.shimmer }))
    }
    
    func testSetTemplateWithCustomColor() {
        // Given
        let aLabel = UILabel()
        
        // When
        aLabel.setTemplate(true, baseColor: .red)
        
        // Then
        let templateLayer = aLabel.layer.sublayers?.first(where: { $0.name == Key.template })
        XCTAssertEqual(templateLayer?.backgroundColor, UIColor.red.cgColor)
    }
    
    
    @available (iOS 13.0, *)
    func testSetTemplateWithoutCustomColorSetsLightColor() {
        // Given
        let aLabel = ACustomLabel(style: .light)
        
        // When
        aLabel.setTemplate(true)
        
        // Then
        let templateLayer = aLabel.layer.sublayers?.first(where: { $0.name == Key.template })
        XCTAssertEqual(templateLayer?.backgroundColor, Color.Placeholder.light.cgColor)
    }
    
    @available (iOS 13.0, *)
    func testSetTemplateWithoutCustomColorSetsDarkColor() {
        // Given
        let aLabel = ACustomLabel(style: .dark)
        
        // When
        aLabel.setTemplate(true)
        
        // Then
        let templateLayer = aLabel.layer.sublayers?.first(where: { $0.name == Key.template })
        XCTAssertEqual(templateLayer?.backgroundColor, Color.Placeholder.dark.cgColor)
    }
}

@available(iOS 13.0, *)
fileprivate final class ACustomLabel: UILabel {
    fileprivate var userInterfaceStyle: UIUserInterfaceStyle!
    
    convenience init(style: UIUserInterfaceStyle) {
        self.init()
        overrideUserInterfaceStyle = style
    }
}

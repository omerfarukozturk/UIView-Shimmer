//
//  UIViewExtensionsTests.swift
//  UIView-ShimmerTests
//
//  Created by Ömer Faruk Öztürk on 16.01.2021.
//

import XCTest
@testable import UIView_Shimmer

final class UIViewExtensionsTests: XCTestCase {

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

        // Then
        let expectedViews = [view1, view2, aButton, aLabel]
        XCTAssertEqual(mainView.allTemplateViews, expectedViews)
    }

    func testAllTemplateViewDiscardExcludedItems() {
        // Given
        let aCell = ACustomTableViewCell()

        // Then
        let expectedViews = [aCell.abutton, aCell.anImageView]
        XCTAssertEqual(aCell.allTemplateViews, expectedViews)
    }

    func testGetFrameForRightAlignedLabel() {
        // Given
        let aLabel = ACustomLabel(contentSize: CGSize(width: 75, height: 25))
        aLabel.frame = CGRect(x: 50, y: 20, width: 200, height: 50)
        aLabel.textAlignment = .right
        aLabel.text = "Jane Doe"

        // Then
        XCTAssertEqual(aLabel.getFrame(), CGRect(x: 125, y: 0, width: 75, height: 25))
    }

    func testGetFrameForCenterAlignedLabel() {
        // Given
        let aLabel = ACustomLabel(contentSize: CGSize(width: 75, height: 25))
        aLabel.frame = CGRect(x: 50, y: 20, width: 200, height: 50)
        aLabel.textAlignment = .center
        aLabel.text = "Jane Doe"

        // Then
        XCTAssertEqual(aLabel.getFrame(), CGRect(x: 62.5, y: 0, width: 75, height: 25))
    }

    func testGetFrameForAnyView() {
        // Given
        let aView = ACustomView()
        aView.backgroundColor = .red
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        aView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let aContentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        aContentView.backgroundColor = .blue
        aContentView.addSubview(aView)
        aView.leftAnchor.constraint(equalTo: aContentView.leftAnchor, constant: 10).isActive = true
        aView.topAnchor.constraint(equalTo: aContentView.topAnchor, constant: 10).isActive = true

        aContentView.layoutIfNeeded()
        aView.layoutIfNeeded()

        // Then
        XCTAssertEqual(aView.getFrame(), CGRect(x: 0, y: 0, width: 120, height: 40))
    }
}

fileprivate final class ACustomView: UIView, ShimmeringViewProtocol { }

fileprivate final class ACustomTableViewCell: UITableViewCell, ShimmeringViewProtocol {
    fileprivate var aLabel = UILabel()
    fileprivate var abutton = UIButton()
    fileprivate var anImageView = UIImageView()

    var shimmeringAnimatedItems: [UIView] {
        [aLabel, abutton, anImageView]
    }

    var excludedItems: Set<UIView> {
        [aLabel]
    }
}

fileprivate final class ACustomLabel: UILabel {
    var contentSize: CGSize!

    convenience init(contentSize: CGSize) {
        self.init()
        self.contentSize = intrinsicContentSize
    }

    override var intrinsicContentSize: CGSize { contentSize }
}

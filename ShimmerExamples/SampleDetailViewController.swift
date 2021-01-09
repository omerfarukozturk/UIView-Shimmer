//
//  SampleDetailViewController.swift
//  ShimmerExamples
//
//  Created by Ömer Faruk Öztürk on 9.01.2021.
//

import UIKit
import UIView_Shimmer

// Conform any type of UIView to ShimmeringViewProtocol that will be animated while shimmering.
extension UILabel: ShimmeringViewProtocol { }
extension UISwitch: ShimmeringViewProtocol { }
extension UIProgressView: ShimmeringViewProtocol { }
extension UITextView: ShimmeringViewProtocol { }
extension UIStepper: ShimmeringViewProtocol { }
extension UISlider: ShimmeringViewProtocol { }

final class SampleDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = .systemBackground
        prepareUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.view.setShimmeringAnimationWithSubviews(template: false)
        }
    }
       
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setShimmeringAnimationWithSubviews(template: true, superviewBackgroundColor: .systemBackground)
    }
    
    private let sampleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.textColor = UIColor.tertiaryLabel
        return label
    }()
    
    private let sampleLongTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        label.numberOfLines = 0
        label.textColor = UIColor.secondaryLabel
        return label
    }()
    
    let sampleSwitch: UISwitch = {
        let view = UISwitch()
        view.isOn = true
        return view
    }()
    
    let sampleProgressView: UIProgressView = {
        let view = UIProgressView()
        view.progressTintColor = .systemIndigo
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view.progress = 0.7
        return view
    }()
    
    let sampleStepper: UIStepper = {
        let view = UIStepper()
        view.value = 100
        return view
    }()
    
    let sampleTextView: UITextView = {
        let view = UITextView()
        view.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    let sampleSlider: UISlider = {
        let view = UISlider()
        view.minimumTrackTintColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view.setValue(0.3, animated: false)
        return view
    }()
    
    private func prepareUI() {
        let contentStack = UIStackView(arrangedSubviews: [
            sampleLabel,
            sampleLongTextLabel,
            sampleSwitch,
            sampleProgressView,
            sampleStepper,
            sampleTextView,
            sampleSlider
        ])
        contentStack.axis = .vertical
        contentStack.alignment = .leading
        contentStack.spacing = 20
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            contentStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        ])
    }
}

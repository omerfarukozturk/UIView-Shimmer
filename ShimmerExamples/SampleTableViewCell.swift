//
//  SampleTableViewCell.swift
//  ShimmerExamples
//
//  Created by Ömer Faruk Öztürk on 9.01.2021.
//

import UIKit
import UIView_Shimmer

final class SampleTableViewCell: UITableViewCell, ShimmeringViewProtocol {
    
    @IBOutlet weak var profileImageBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondActionButton: UIButton!
    
    var shimmeringAnimatedItems: [UIView] {
        [
            profileImageBackgroundView,
            nameLabel,
            actionButton,
            secondLabel,
            secondActionButton
        ]
    }
    
    // You can define excluded views not to be animated.
    /*
    var excludedItems: Set<UIView> {
        [nameLabel]
    }
     */
}

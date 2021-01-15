# UIView-Shimmer

[![Build Status](https://travis-ci.com/omerfarukozturk/UIView-Shimmer.svg?token=JVcAj8G17QJpMKZwksky&branch=master)](https://travis-ci.com/omerfarukozturk/UIView-Shimmer)
![Platform: iOS](https://img.shields.io/badge/platform-ios-blue)
![License](https://img.shields.io/badge/license-MIT-lightgrey)
![CocaPods Compatible](https://img.shields.io/badge/pod-v1.0.2-blue)
![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen)
![Swift Package Manager Compatible](https://img.shields.io/badge/spm-compatible-brightgreen)

> Simple way to apply shimmering effect to any UIView.

## Requirements

* iOS 10+


## Installation

### CocoaPods
`UIView-Shimmer` is available through [CocoaPods](https://cocoapods.org/pods/UIView-Shimmer). To install it, simply add the following line to your Podfile:

```ruby
pod 'UIView-Shimmer', '~> 1.0'
```
Then import
```swift
import UIView_Shimmer
```

### Swift Package Manager
`UIView-Shimmer` is available through [Swift Package Manager](https://swift.org/package-manager/). 

To add package go to `File -> Swift Packages -> Add Package Dependancy `

```ruby
name: "UIView-Shimmer"
url: https://github.com/omerfarukozturk/UIView-Shimmer.git
version: 1.0.1
```

### Manuel
If you do not want to add extra dependency, just copy related extensions to your project.

```
UIView+Extensions.swift
UIView+Template.swift
UIView+Shimmer.swift
```

## Usage 

Conform any view to `ShimmeringViewProtocol` which identifies that shimmering animation will be applied to it or specified subviews. Define which subviews are animated in `shimmeringAnimatedItems`.

```swift
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
}
```

Or alternatively you can define that a type of view will be animated just extending `ShimmeringViewProtocol`

```swift
extension UILabel: ShimmeringViewProtocol { }
extension UIButton: ShimmeringViewProtocol { }
extension UITextView: ShimmeringViewProtocol { }
... 
```

Then call `setShimmeringAnimationWithSubviews(template:superviewBackgroundColor:)` extension of `UIView` for any view (basically a superview). This function finds all descendand subviews to be set as template and applies animation. Before the call, make sure the view is loaded.

For UITableViewCell, to mark as template, view you call on `willDisplay` delegate.

```swift
cell.setShimmeringAnimationWithSubviews(template: true, superviewBackgroundColor: .systemBackground)
```

You can hide, for example after a completion of a task, with `template = false` parameter. It is not needed to give `superviewBackgroundColor` value when hiding template (with shimmering) animation.

```swift
cell.setShimmeringAnimationWithSubviews(template: false)
```

Light Theme                | Dark Theme
:-------------------------:|:-------------------------:
![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_animation_light.gif)  |  ![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_animation_dark.gif)


## Example 
The exmple project demonstrates how to use it. Pull the repo and check [ShimmerExamples](/ShimmerExamples).

## License
UIView-Shimmer is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

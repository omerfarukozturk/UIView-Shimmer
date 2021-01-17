
<h1 align="center">UIView-Shimmer</h1>

<h4 align="center">Super easy way to apply shimmering effect to any view and its subviews for iOS applications.</h4>
<br>
<p align="center">
    <a href="https://travis-ci.com/omerfarukozturk/UIView-Shimmer"><img src="https://travis-ci.com/omerfarukozturk/UIView-Shimmer.svg?token=JVcAj8G17QJpMKZwksky&branch=master"/></a>
    <img src="https://img.shields.io/badge/platform-ios-blue" alt="Platform: iOS"/>
    <img src="https://img.shields.io/badge/license-MIT-lightgrey" alt="License"/>
    <img src="https://img.shields.io/badge/pod-v1.0.2-blue" alt="CocaPods Compatible"/>
    <img src="https://img.shields.io/badge/Carthage-compatible-brightgreen" alt="Carthage Compatible"/>
    <img src="https://img.shields.io/badge/SPM-compatible-brightgreen" alt="CaSwift Package Manager Compatible"/>
</p>

<p align="center" vertical-align="center">
    <img src="https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/template_default.png"/>
    <img src="https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_animated.gif"/>
</p>


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
version: 1.0.2
```

### Manuel
If you do not want to add extra dependency, just copy related extensions to your project.

```
UIView+Extensions.swift
UIView+Template.swift
UIView+Shimmer.swift
```

## Usage 

### Shimmering Animation

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
cell.setTemplateWithSubviews(isLoading, viewBackgroundColor: .systemBackground)
```

You can hide, for example after a completion of a task, with `template = false` parameter. It is not needed to give `superviewBackgroundColor` value when hiding template (with shimmering) animation.

```swift
cell.setTemplateWithSubviews(template: false)
```

Light Theme                | Dark Theme
:-------------------------:|:-------------------------:
![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_animation_light.gif)  |  ![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_animation_dark.gif)

#### Excluded Views

You can set `excludedItems` with `ShimmeringViewProtocol` to set views will be excluded while setting animation.

```swift
var excludedItems: Set<UIView> {
    [nameLabel]
}
```
    
![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_excluded.png)

<p></p>

#### Placeholder

You can only set template view without shimmering animation via setting `animation: false`. (like `.redacted(reason:  .placeholder)` in SwiftUI)

```swift
view.setTemplateWithSubviews(true, animate: false)
```

Default                | Template
:-------------------------:|:-------------------------:
![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/template_default.png)  |  ![](https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/template_on.png)

### Note
Template view (and also Shimmering effect) frames are calculated based on their `intrinsicContentSize` or their layout constraints. So you should set dummy values for `UILabels`, `UITextView` etc. or set their constraints to visually draw their templates.


## Example 
The exmple project demonstrates how to use it. Pull the repo and check [ShimmerExamples](/ShimmerExamples).

## License
UIView-Shimmer is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

<p align="center">
    <img src="https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/uiview-shimmer.png"/>
</p>

<h4 align="center">Super easy way to apply shimmering effect to any view and its subviews for iOS applications.</h4>
<br>
<p align="center">
    <img src="https://github.com/omerfarukozturk/UIView-Shimmer/workflows/Swift%20CI/badge.svg"/>
    <a href="https://www.codacy.com/gh/omerfarukozturk/UIView-Shimmer/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=omerfarukozturk/UIView-Shimmer&amp;utm_campaign=Badge_Grade"><img src="https://app.codacy.com/project/badge/Grade/83ee6e94d8774d029e297503016c9b16"/></a>
    <a href="https://www.codacy.com/gh/omerfarukozturk/UIView-Shimmer/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=omerfarukozturk/UIView-Shimmer&amp;utm_campaign=Badge_Coverage"><img src="https://app.codacy.com/project/badge/Coverage/83ee6e94d8774d029e297503016c9b16"/></a>
    <img src="https://img.shields.io/badge/platform-ios-blue" alt="Platform: iOS"/>
    <img src="https://img.shields.io/badge/license-MIT-lightgrey" alt="License"/>
    <img src="https://img.shields.io/badge/pod-v1.0.2-blue" alt="CocaPods Compatible"/>
    <img src="https://img.shields.io/badge/Carthage-compatible-brightgreen" alt="Carthage Compatible"/>
    <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen" alt="CaSwift Package Manager Compatible"/>
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
If you do not want to add extra dependency, just copy [Sources](Sources/UIView-Shimmer/Sources) folder into your project.

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
    
<table><tr><td>
    <img src="https://github.com/omerfarukozturk/UIView-Shimmer/blob/master/Resources/shimmer_excluded.png" />
</td></tr></table>


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

## Contributing
Contributions are welcome 🙌

## License
UIView-Shimmer is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

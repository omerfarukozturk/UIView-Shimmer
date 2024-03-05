Pod::Spec.new do |spec|

  spec.name         = "UIView-Shimmer"
  spec.version      = "1.0.4"
  spec.summary      = "UIView extension to apply shimmering effect to any view."

  spec.description  = <<-DESC
Mark any UIView element as template view and add shimmering effect on it with simple function.
                   DESC

  spec.homepage     = "https://github.com/omerfarukozturk/UIView-Shimmer"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Ömer Faruk Öztürk" => "omer.f.oztrk@gmail.com" }

  spec.platform     = :ios, "10.0"
  spec.swift_version = "5.3"

  spec.source       = { :git => "https://github.com/omerfarukozturk/UIView-Shimmer.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/UIView-Shimmer/**/*.{h,m,swift}"

  spec.resources = 'UIView-Shimmer/Resources/PrivacyInfo.xcprivacy'


  # spec.public_header_files = "Classes/**/*.h"

end

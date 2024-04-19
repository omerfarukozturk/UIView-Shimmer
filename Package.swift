// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIView-Shimmer",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UIView-Shimmer",
            targets: ["UIView-Shimmer"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UIView-Shimmer",
            dependencies: [],
            exclude: ["Resources/Info.plist"],
            resources: [.process("Resources/PrivacyInfo.xcprivacy")]),
        .testTarget(
            name: "UIView-ShimmerTests",
            dependencies: ["UIView-Shimmer"],
            exclude: ["Info.plist"])
    ]
)

// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HDXLCommonUtilities",
    platforms: [
      SupportedPlatform.iOS(.v13),
      SupportedPlatform.macOS(.v10_15),
      SupportedPlatform.tvOS(.v13),
      SupportedPlatform.watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "HDXLCommonUtilities",
            targets: ["HDXLCommonUtilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "HDXLCommonUtilities",
            dependencies: []),
        .testTarget(
            name: "HDXLCommonUtilitiesTests",
            dependencies: ["HDXLCommonUtilities"]),
    ]
)

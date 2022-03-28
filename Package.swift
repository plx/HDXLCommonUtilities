// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "HDXLCommonUtilities",
  platforms: [
    SupportedPlatform.iOS(.v15),
    SupportedPlatform.macOS(.v12),
    SupportedPlatform.tvOS(.v15),
    SupportedPlatform.watchOS(.v8)
  ],
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "HDXLCommonUtilities",
      targets: ["HDXLCommonUtilities"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/plx/HDXLTestingUtilities",
      from: "0.0.8"
    ),
    .package(
      url: "https://github.com/apple/swift-numerics",
      from: "0.0.1"
    )
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "HDXLCommonUtilities",
      dependencies: [
        .product(
          name: "Numerics",
          package: "swift-numerics"
        )
      ]
    ),
    .testTarget(
      name: "HDXLCommonUtilitiesTests",
      dependencies: [
        "HDXLCommonUtilities",
        "HDXLTestingUtilities",
        .product(
          name: "Numerics",
          package: "swift-numerics"
        )
      ]
    )
  ],
  swiftLanguageVersions: [
    SwiftVersion.v5
  ]
)


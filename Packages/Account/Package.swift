// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Account",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v17),
    .visionOS(.v1),
  ],
  products: [
    .library(
      name: "Account",
      targets: ["Account"]
    )
  ],
  dependencies: [
    .package(name: "Network", path: "../Network"),
    .package(name: "Models", path: "../Models"),
    .package(name: "StatusKit", path: "../StatusKit"),
    .package(name: "Env", path: "../Env"),
    .package(url: "https://github.com/dkk/WrappingHStack", from: "2.2.11"),
    .package(name: "DesignSystem", path: "../DesignSystem"),
  ],
  targets: [
    .target(
      name: "Account",
      dependencies: [
        .product(name: "Network", package: "Network"),
        .product(name: "Models", package: "Models"),
        .product(name: "StatusKit", package: "StatusKit"),
        .product(name: "Env", package: "Env"),
        .product(name: "WrappingHStack", package: "WrappingHStack"),
        .product(name: "DesignSystem", package: "DesignSystem"),
      ],
      swiftSettings: [
        .swiftLanguageMode(.v6)
      ]
    ),
    .testTarget(
      name: "AccountTests",
      dependencies: ["Account"]
    ),
  ]
)

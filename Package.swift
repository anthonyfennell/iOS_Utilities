// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Utilities",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Utilities",
            targets: ["Utilities"]),
    ],
    dependencies: [
        // none
    ],
    targets: [
        .target(
            name: "Utilities",
            dependencies: []),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]),
    ]
)

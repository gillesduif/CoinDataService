// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoinDataService",
        platforms: [
            .macOS(.v12),
            .iOS(.v13),
            .tvOS(.v13),
            .watchOS(.v8)
        ],
        products: [
            .library(
                name: "CoinDataService",
                targets: ["CoinDataService"]),
        ],
        targets: [
            .target(
                name: "CoinDataService")
        ]
)

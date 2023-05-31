// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pack Books",
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation", from: "0.9.16"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "CommandLineToolCore",
            dependencies: ["ZIPFoundation"]
        ),
        .executableTarget(
            name: "pack-epub",
            dependencies: [
                "CommandLineToolCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
            ]),
        .testTarget(
            name: "pack-epubTests",
            dependencies: ["pack-epub"]),
    ]
)

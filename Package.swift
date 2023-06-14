// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Simplog",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "Simplog",
            targets: ["Simplog"]
        )
    ],
    targets: [
        .target(
            name: "Simplog",
            swiftSettings: [
                .define("REDACT", .when(configuration: .release)),
            ]
        ),
        
        // The Simplog Test Target
        .testTarget(
            name: "SimplogTests",
            dependencies: ["Simplog"]
        )
    ]
)

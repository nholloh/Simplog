// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Simplog",
    platforms: [.iOS(.v14)],
    products: [
        
        // The standard Simplog library.
        .library(
            name: "Simplog",
            targets: ["Simplog"]
        ),
    ],
    
    targets: [
        
        // The target which contains all logic required for logging.
        .target(
            name: "Simplog",
            dependencies: [],
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

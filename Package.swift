// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Simplog",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Simplog",
            targets: ["SimplogBase", "Simplog"]
        ),
        .library(
            name: "SimplogDisabled",
            targets: ["SimplogBase", "SimplogDisabled"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SimplogBase",
            dependencies: []
        ),
        .target(
            name: "Simplog",
            dependencies: ["SimplogBase"]
        ),
        .target(
            name: "SimplogDisabled",
            dependencies: ["SimplogBase"]
        ),
        .testTarget(
            name: "SimplogTests",
            dependencies: ["Simplog"]),
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Simplog",
    platforms: [.iOS(.v9)],
    products: [
        
        // The standard Simplog library, bundling the SimplogBase
        // and the SimplogEnabled targets together.
        .library(
            name: "Simplog",
            
            // DO NOT CHANGE THE ORDER, OTHERWISE TYPEFORWARDING
            // #canImport WILL FAIL.
            targets: ["SimplogEnabled", "Simplog"]
        ),
        
        // The disabled Simplog library. It bundles the SimplogBase
        // together with SimplogDisabled, however SimplogDisabled will
        // not forward any calls to logging functions to the actual
        // logger in SimplogBase. This guarantees a compiletime-safe
        // disabling of all logging activities. This may be useful for
        // companies where data privacy in production is an issue.
        .library(
            name: "SimplogDisabled",
            
            // DO NOT CHANGE THE ORDER, OTHERWISE TYPEFORWARDING
            // #canImport WILL FAIL.
            targets: ["SimplogDisabled", "Simplog"]
        )
    ],
    
    targets: [
        
        // The base target which contains all logic required for logging.
        .target(
            name: "SimplogBase",
            dependencies: [],
            swiftSettings: [
                .define("REDACT", .when(configuration: .release)),
            ]
        ),
        
        // The Simplog Enabled target. It contains an implementation of the
        // standard logger interface and collects all necessary information
        // to forward to the logger in SimplogBase.
        .target(
            name: "SimplogEnabled",
            dependencies: ["SimplogBase"]
        ),
        
        // The Simplog Disabled target. It shares an interface with the
        // actual implementation of Simplog in SimplogEnabled, however does
        // *not* actually forward your log statements to SimplogBase for logging.
        // It is bundled into the SimplogDisabled library for compiletime-safe
        // disabling of all logging activities. This may be useful for companies
        // where data privacy in production is an issue.
        .target(
            name: "SimplogDisabled",
            dependencies: ["SimplogBase"]
        ),
        
        // The main Simplog target, which always needs to be imported.
        // It will typeforward types from SimplogBase and either SimplogEnabled
        // or SimplogDisabled target, depending on your project's dependencies.
        // If, for whatever reason, both targets SimplogDisabled and SimplogEnabled
        // are linked together into a binary, SimplogDisabled will take precedence
        // and disable all logging activities.
        .target(
            name: "Simplog",
            dependencies: ["SimplogBase"]
        ),
        
        // The Simplog Test Target
        .testTarget(
            name: "SimplogTests",
            dependencies: ["Simplog", "SimplogEnabled"]
        )
    ]
)

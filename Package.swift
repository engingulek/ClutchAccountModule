// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClutchAccountModule",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClutchAccountModule",
            targets: ["ClutchAccountModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
        .package(url: "https://github.com/engingulek/ClutchViewControllerAbleKit", from: "0.0.2"),
        .package(url: "https://github.com/engingulek/ClutchCoreKit", from: "0.1.6")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ClutchAccountModule",
            dependencies: [
                
                .product(name: "ClutchViewControllerAbleKit", package: "ClutchViewControllerAbleKit"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "ClutchCoreKit", package: "ClutchCoreKit"),
            ]
        ),
        .testTarget(
            name: "ClutchAccountModuleTests",
            dependencies: ["ClutchAccountModule"]
        ),
    ]
)

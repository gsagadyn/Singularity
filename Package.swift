// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Singularity",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "Singularity", targets: ["Singularity"])
    ],
    targets: [
        .target(name: "Singularity", dependencies: [], path: "Sources")
    ]
)

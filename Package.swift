// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CronometerParser",
    // Dependencies declare other packages that this package depends on.
    dependencies: [
        .package(url: "https://github.com/yaslab/CSV.swift.git", .upToNextMinor(from: "2.5.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .executableTarget(
            name: "CronometerParser",
            dependencies: [
            	.product(name: "CSV", package: "csv.swift")
            ]
        ),
        .testTarget(
            name: "CronometerParserTests",
            dependencies: ["CronometerParser"]
        ),
    ]
)

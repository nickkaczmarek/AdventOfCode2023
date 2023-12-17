// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day3",
    platforms: [.macOS(.v13)],
    targets: [
        .target(
            name: "Day3",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        ),
        .executableTarget(
            name: "Day3CLI",
            dependencies: ["Day3"],
            resources: [
                .process("Day3.txt")
            ]
        ),
        .testTarget(
            name: "Day3Tests",
            dependencies: ["Day3"],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)


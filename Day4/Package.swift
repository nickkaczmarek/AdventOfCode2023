// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day4",
    platforms: [.macOS(.v13)],
    targets: [
        .target(
            name: "Day4",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        ),
        .executableTarget(
            name: "Day4CLI",
            dependencies: ["Day4"],
            resources: [
                .process("Day4.txt")
            ]
        ),
        .testTarget(
            name: "Day4Tests",
            dependencies: ["Day4"],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)


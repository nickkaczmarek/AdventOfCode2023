// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Day1",
    platforms: [.macOS(.v13)],
    targets: [
        .target(
            name: "Day1",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        ),
        .executableTarget(
            name: "Day1CLI",
            dependencies: ["Day1"],
            resources: [
                .process("Day1.txt")
            ]
        ),
        .testTarget(
            name: "Day1Tests",
            dependencies: ["Day1"]
        )
    ]
)

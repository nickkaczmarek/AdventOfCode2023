// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Day2",
    platforms: [.macOS(.v13)],
    targets: [
        .target(
            name: "Day2",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        ),
        .executableTarget(
            name: "Day2CLI",
            dependencies: ["Day2"]
        ),
        .testTarget(
            name: "Day2Tests",
            dependencies: ["Day2"]
        )
    ]
)

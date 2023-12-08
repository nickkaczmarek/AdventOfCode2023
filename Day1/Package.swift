// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Day1",
    targets: [
        .executableTarget(
            name: "Day1",
            resources: [
                .process("Day1.txt")
            ]
        ),
    ]
)

for target in package.targets {
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(
        .unsafeFlags([
            "-Xfrontend", "-warn-concurrency",
            "-Xfrontend", "-enable-actor-data-race-checks",
            "-enable-bare-slash-regex",
        ])
    )
}

// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "TimeTravel",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "TimeTravel",
            targets: ["TimeTravel"]
        ),
    ],
    targets: [
        .target(
            name: "TimeTravel",
            swiftSettings: [
                .enableUpcomingFeature("InternalImportsByDefault")
            ]
        ),
        .testTarget(
            name: "TimeTravelTests",
            dependencies: ["TimeTravel"]
        ),
    ]
)

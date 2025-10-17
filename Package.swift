// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "TimeTravel",
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

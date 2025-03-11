// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWTwelveEqualTemperament",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "WWTwelveEqualTemperament", targets: ["WWTwelveEqualTemperament"]),
    ],
    targets: [
        .target(name: "WWTwelveEqualTemperament", resources: [.process("Material/12-Equal-Temperament.json"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

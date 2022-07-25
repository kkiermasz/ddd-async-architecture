// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ddd-async-architecture",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(
            name: "ddd-async-architecture",
            targets: [
                "SwiftTemplate"
            ]
        ),
    ],
    targets: [
        .target(
            name: "MovieCharactersFeature",
            dependencies: [
                "MovieCharactersDomain"
            ]
        ),
        .target(
            name: "MovieCharactersDomain",
            dependencies: [

            ]
        ),
        .target(
            name: "MovieCharactersDomain",
            dependencies: [
                "MovieCharactersDomain"
            ]
        ),
    ]
)


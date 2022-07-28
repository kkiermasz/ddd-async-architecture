
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(
            name: "Presentation",
            targets: [
                "DashboardFeature",
                "MovieCharactersFeature"
            ]
        ),
        .library(
            name: "Domain",
            targets: [
                "MovieCharactersDomain"
            ]
        ),
        .library(
            name: "Data",
            targets: [
                "MovieCharactersData"
            ]
        ),
    ],
    targets: [
        .target(
            name: "MovieCharactersFeature",
            dependencies: [
                "MovieCharactersDomain",
                "Utilities"
            ],
            path: "Sources/Presentation/MovieCharactersFeature"
        ),
        .testTarget(
            name: "MovieCharactersFeatureTests",
            dependencies: [
                "MovieCharactersFeature"
            ],
            path: "Tests/Presentation/MovieCharactersFeatureTests"
        ),
        .target(
            name: "DashboardFeature",
            dependencies: [
                "MovieCharactersDomain",
                "Utilities"
            ],
            path: "Sources/Presentation/DashboardFeature"
        ),
        .target(
            name: "MovieCharactersDomain",
            path: "Sources/Domain/MovieCharactersDomain"
        ),
        .target(
            name: "MovieCharactersData",
            dependencies: [
                "MovieCharactersDomain"
            ],
            path: "Sources/Data/MovieCharactersData"
        ),
        .target(
            name: "Utilities",
            dependencies: [
                "UtilitiesRuntime"
            ]
        ),
        .target(name: "UtilitiesRuntime")
    ]
)

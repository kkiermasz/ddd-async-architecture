// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AsyncFrameworks",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(
            name: "AsyncFrameworks",
            targets: [
                "MovieCharactersDomain",
                "MovieCharactersFeature",
                "MovieCharactersData"            ]
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
            name: "MovieCharactersData",
            dependencies: [
                "MovieCharactersDomain"
            ]
        ),
    ]
)

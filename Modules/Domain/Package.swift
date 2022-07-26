// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(
            name: "Domain",
            targets: [
                "MovieCharactersDomain"
            ]
        ),
    ],
    targets: [
        .target(
            name: "MovieCharactersDomain"
        )
    ]
)

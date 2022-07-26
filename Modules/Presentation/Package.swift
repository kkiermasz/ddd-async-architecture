// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(
            name: "Presentation",
            targets: [
                "MovieCharactersFeature"
            ]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "MovieCharactersFeature",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ]
        )
    ]
)

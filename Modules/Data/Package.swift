// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .library(
            name: "Data",
            targets: [
                "MovieCharactersData"
            ]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "MovieCharactersData",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
            ]
        )
    ]
)

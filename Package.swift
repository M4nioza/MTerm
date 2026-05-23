// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MTerm",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/migueldeicaza/SwiftTerm", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "MTerm",
            dependencies: [
                .product(name: "SwiftTerm", package: "SwiftTerm"),
            ]
        )
    ]
)

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TechnicalFundamentalsSwift",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TechnicalFundamentalsSwift",
            targets: ["TechnicalFundamentalsSwift"]
        ),
    ],
    targets: [
        .target(
            name: "TechnicalFundamentalsSwift",
            path: "problems"
        ),
        .testTarget(
            name: "TechnicalFundamentalsSwiftTests",
            dependencies: ["TechnicalFundamentalsSwift"],
            path: "Tests"
        ),
    ]
)
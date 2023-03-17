// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "Core",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
      //  .package(name: "Domain", path:"/Users/a1softech/data/projects/e-store/Domain" )
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Core",
            dependencies: [
               // "Domain"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
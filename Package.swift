// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "MyMacro2",
  platforms: [.macOS(.v13), .iOS(.v14), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "MyMacro2",
      targets: ["MyMacro2"]
    ),
    .executable(
      name: "MyMacro2Client",
      targets: ["MyMacro2Client"]
    ),
  ],
  dependencies: [
    // Depend on the latest Swift 5.9 prerelease of SwiftSyntax
    .package(
      url: "https://github.com/apple/swift-syntax.git",
      from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b"
    )
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    // Macro implementation that performs the source transformation of a macro.
    .macro(
      name: "MyMacro2Macros",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
      ]
    ),

    // Library that exposes a macro as part of its API, which is used in client programs.
    .target(name: "MyMacro2", dependencies: ["MyMacro2Macros"]),

    // A client of the library, which is able to use the macro in its own code.
    .executableTarget(name: "MyMacro2Client", dependencies: ["MyMacro2"]),

    // A test target used to develop the macro implementation.
    .testTarget(
      name: "MyMacro2Tests",
      dependencies: [
        "MyMacro2",
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),
  ]
)

// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "aoc2019",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .executable(
      name: "day1",
      targets: ["day1"]),
    .executable(
      name: "day2",
      targets: ["day2"]),
    .executable(
      name: "day3",
      targets: ["day3"]),
    .executable(
      name: "day5",
      targets: ["day5"]),
    .executable(
      name: "day6",
      targets: ["day6"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "IntcodeComp",
      dependencies: []),
    .target(
      name: "day1",
      dependencies: ["day1lib"]),
    .target(
      name: "day1lib",
      dependencies: []),
    .testTarget(
      name: "day1Tests",
      dependencies: ["day1lib"]),
    .target(
      name: "day2",
      dependencies: ["IntcodeComp"]),
    .testTarget(
      name: "day2Tests",
      dependencies: ["IntcodeComp"]),
    .target(
      name: "day3",
      dependencies: ["day3lib"]),
    .target(
      name: "day3lib",
      dependencies: []),
    .testTarget(
      name: "day3Tests",
      dependencies: ["day3lib"]),
    .target(
      name: "day5",
      dependencies: ["IntcodeComp"]),
    .testTarget(
      name: "day5Tests",
      dependencies: ["IntcodeComp"]),
    .target(
      name: "day6",
      dependencies: ["day6lib"]),
    .target(
      name: "day6lib",
      dependencies: []),
    .testTarget(
      name: "day6Tests",
      dependencies: ["day6lib"]),
  ]
)

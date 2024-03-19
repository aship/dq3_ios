// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "DQ3",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "DQ3",
            targets: ["AppModule"],
            bundleIdentifier: "info.office-aship.DQ3",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .bandage),
            accentColor: .presetColor(.indigo),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)

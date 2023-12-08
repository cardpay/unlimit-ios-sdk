// swift-tools-version:5.9

import PackageDescription

let SWINJECT_VERSION: PackageDescription.Version = "2.8.0"
let MOYA_VERSION: PackageDescription.Version = "15.0.3"
let ALAMOFIRE_VERSION: PackageDescription.Version = "5.6.4"
let UNLIMINT_CORE_VERSION: PackageDescription.Version = "2.0.1"
let UNLIMINT_SWIFTUI_VERSION: PackageDescription.Version = "2.0.1"

let package = Package(
    
  name: "Unlimint",
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "UnlimintSDK_Core",
      targets: ["UnlimintSDK_CoreTarget"]
    ),
    .library(
      name: "UnlimintSDK_SwiftUI",
      targets: ["UnlimintSDK_SwiftUITarget"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/Swinject/Swinject.git", from: SWINJECT_VERSION),
    .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: MOYA_VERSION)),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: ALAMOFIRE_VERSION))

  ],
  
  targets: [
    
    .target(
      name: "UnlimintSDK_CoreTarget",
      dependencies: [
        .target(name: "UnlimintSDK_Core_Wrapper", condition: .when(platforms: [.iOS])),
        .target(name: "Unlimint_Alamofire", condition: .when(platforms: [.iOS]))
        
      ],
      path: "SPM_UnlimintSDK_Core"
    ),

    .target(
        name: "UnlimintSDK_SwiftUITarget",
        dependencies: [
        .target(name: "UnlimintSDK_SwiftUI_Wrapper", condition: .when(platforms: [.iOS])),
        ],
          path: "SPM_UnlimintSDK_SwiftUI"
    ),
    
    .target(
      name: "UnlimintSDK_Core_Wrapper",
      dependencies: [
        .target(
          name: "UnlimintSDK_Core",
          condition: .when(platforms: [.iOS])
        ),
        .product(name: "Swinject", package: "Swinject"),
        .product(name: "Moya", package: "Moya"),
      ],
      path: "UnlimintSDK_Core_Wrapper",
      linkerSettings: [
        .linkedLibrary("z"),
      ]
    ),
    
    .target(
          name: "UnlimintSDK_SwiftUI_Wrapper",
          dependencies: [
            .target(
              name: "UnlimintSDK_SwiftUI",
              condition: .when(platforms: [.iOS])
            ),
            .product(name: "Swinject", package: "Swinject"),
            .product(name: "Moya", package: "Moya"),
          ],
          path: "UnlimintSDK_SwiftUI_Wrapper",
          linkerSettings: [
            .linkedLibrary("z"),
          ]
     ),
    .target(
        name: "Unlimint_Alamofire",
        dependencies: [
            .target(
                name: "UnlimintSDK_Core",
                condition: .when(platforms: [.iOS])
            ),
            .product(name: "Alamofire", package: "Alamofire")
                
        ],
        path: "Unlimint_Alamofire",
        linkerSettings: [
            .linkedLibrary("z"),
        ]
    ),
    
    .binaryTarget(
      name: "UnlimintSDK_Core",
      url: "https://storage.googleapis.com/unl_ios/SPM/2.0.9/UnlimintSDK-Core.xcframework.zip",
      checksum: "b2bef0998b9f8b71028289c686e54f6f018d82e16ae5734e592bd6fcedc86e7b"
    ),
    
    .binaryTarget(
      name: "UnlimintSDK_SwiftUI",
      url: "https://storage.googleapis.com/unl_ios/SPM/2.0.9/UnlimintSDK-SwiftUI.xcframework.zip",
      checksum: "bd0ee70f20d3aa95c8a934335bc2be18058d13818ab70420c8a54c144b23a56c"
    )
    
  ],
  swiftLanguageVersions: [.v5]
)

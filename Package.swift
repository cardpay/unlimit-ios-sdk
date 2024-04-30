// swift-tools-version:5.9

import PackageDescription

let SWINJECT_VERSION: PackageDescription.Version = "2.8.4"
let MOYA_VERSION: PackageDescription.Version = "15.0.3"
let ALAMOFIRE_VERSION: PackageDescription.Version = "5.9.1"
let UNLIMINT_CORE_VERSION: PackageDescription.Version = "2.1.4"
let UNLIMINT_SWIFTUI_VERSION: PackageDescription.Version = "2.1.4"

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
      url: "https://storage.googleapis.com/unl_ios/SPM/2.1.5/UnlimintSDK-Core.zip",
      checksum: "4be7ff6636a98344c9535d93d355d539a4792bf61f385d7c264e80add6f64399"
    ),
    
    .binaryTarget(
      name: "UnlimintSDK_SwiftUI",
      url: "https://storage.googleapis.com/unl_ios/SPM/2.1.5/UnlimintSDK-SwiftUI.zip",
      checksum: "a4f0d1236eec93f88f8aa0750e546cb5a2b388147e26b1bfeadedcab3e34298b"
    )
    
  ],
  swiftLanguageVersions: [.v5]
)

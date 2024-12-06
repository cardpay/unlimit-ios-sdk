// swift-tools-version:5.9

import PackageDescription

let SWINJECT_VERSION: PackageDescription.Version = "2.8.4"
let MOYA_VERSION: PackageDescription.Version = "15.0.3"
let ALAMOFIRE_VERSION: PackageDescription.Version = "5.9.1"
let UNLIMINT_CORE_VERSION: PackageDescription.Version = "3.1.0"
let UNLIMINT_SWIFTUI_VERSION: PackageDescription.Version = "3.1.0"

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
      url: "https://storage.googleapis.com/unl_ios/SPM/3.1.0/UnlimintSDK-Core.zip",
      checksum: "1c0e7e2489f6aa7c938140ad8adc52cf33704ffe1800bf46c6f408a69b3cced8"
    ),
    
    .binaryTarget(
      name: "UnlimintSDK_SwiftUI",
      url: "https://storage.googleapis.com/unl_ios/SPM/3.1.0/UnlimintSDK-SwiftUI.zip",
      checksum: "78617a357412b10d385c32a69d45dd599d97a66377435fc65e32b781937191ed"
    )
    
  ],
  swiftLanguageVersions: [.v5]
)

#
# Be sure to run `pod lib lint UnlimintSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html>
#

Pod::Spec.new do |s|
  s.name             = 'UnlimintSDK_SwiftUI'
  s.version          = '2.1.0'
  s.summary          = 'A short description of UnlimintSDK.'
  s.homepage         = 'https://www.unlimit.com'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'd.gnezdilov' => 'd.gnezdilov@unlimint.com' }

  s.platform = :ios, '14.0'
  s.swift_version = '5.3'

  s.source = {
      :http => "https://storage.googleapis.com/unl_ios/Cocoapod/2.1.0/UnlimintSDK_SwiftUI.zip"
  }

  s.vendored_frameworks = [
    'UnlimintSDK_SwiftUI.xcframework'
  ]
  
  s.weak_frameworks = "SwiftUI"
  s.frameworks = 'UIKit'
  s.libraries = "z"

  s.dependency 'Swinject'
  s.dependency 'UnlimintSDK_Core', '~> 2.0.9'
  s.source_files = "UnlimintSDK_SwiftUI/**/*.{swift,lproj,strings}"
end

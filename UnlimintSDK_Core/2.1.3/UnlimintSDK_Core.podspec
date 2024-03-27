#
# Be sure to run `pod lib lint UnlimintSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html>
#

Pod::Spec.new do |s|
  s.name             = 'UnlimintSDK_Core'
  s.version          = '2.1.3'
  s.summary          = 'A short description of UnlimintSDK.'
  s.homepage         = 'https://www.unlimit.com'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'd.gnezdilov' => 'd.gnezdilov@unlimint.com' }

  s.platform = :ios, '14.0'
  s.swift_version = '5.3'

  s.source = {
      :http => "https://storage.googleapis.com/unl_ios/Cocoapod/2.1.3/UnlimintSDK_Core.zip"
  }

  s.vendored_frameworks = [
    'UnlimintSDK_Core.xcframework'
  ]
  
  s.frameworks = 'UIKit'
  s.libraries = "z"

  s.dependency 'Moya', '~> 15.0.0'

end

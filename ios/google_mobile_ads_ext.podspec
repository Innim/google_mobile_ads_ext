#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint google_mobile_ads_ext.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'google_mobile_ads_ext'
  s.version          = '0.1.0'
  s.summary          = 'Missing AdMob features.'
  s.description      = <<-DESC
  Implements some missing AdMob features from google_mobile_ads.
                       DESC
  s.homepage         = 'https://github.com/Innim/google_mobile_ads_ext'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Innim' => 'developer@innim.ru' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Google-Mobile-Ads-SDK'
  s.platform = :ios, '9.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS' => 'armv7 arm64 x86_64' }
  s.static_framework = true
  s.swift_version = '5.0'
end

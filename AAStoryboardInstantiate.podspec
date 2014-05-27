Pod::Spec.new do |s|
  s.name             = "AAStoryboardInstantiate"
  s.version          = "0.0.1"
  s.summary          = "The simpliest way to instantiate View Controller from Storyboard"
  s.homepage         = 'https://github.com/orkenstein/AAStoryboardInstantiate'
  s.license          = 'MIT'
  s.author           = { "orkenstein" => "orkru666@gmail.com" }
  s.source           = { :git => "https://github.com/orkenstein/AAStoryboardInstantiate.git", :tag => '0.0.1' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Classes/ios/UIViewController+instantiate.{h,m}'
  s.ios.exclude_files = 'Classes/osx'
end

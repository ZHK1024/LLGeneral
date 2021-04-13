#
# Be sure to run `pod lib lint LLGeneral.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LLGeneral'
  s.version          = '0.1.1'
  s.summary          = '常用代码库.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ZHK1024/LLGeneral'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { ' ZHK1024' => 'ZHK1024@foxmail.com' }
  s.source           = { :git => 'https://github.com/ZHK1024/LLGeneral.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  
  s.swift_version = '5.0'

  s.source_files = 'LLGeneral/Classes/**'
  
  #**********************
  # Math
  s.subspec 'Math' do |math|
      math.source_files = 'LLGeneral/Classes/Math/**/*'
  end
  
  #**********************
  # Extensions
  s.subspec 'Extensions' do |ext|
      # CoreGraphics
      ext.subspec 'CoreGraphics' do |cg|
          cg.source_files = 'LLGeneral/Classes/Extensions/CoreGraphics/**/*'
      end
      
      # CoreImage
      ext.subspec 'CoreImage' do |ci|
          ci.source_files = 'LLGeneral/Classes/Extensions/CoreImage/**/*'
      end
      
      # Foundation
      ext.subspec 'Foundation' do |fd|
          fd.source_files = 'LLGeneral/Classes/Extensions/Foundation/**/*'
      end
      
      # UIKit
      ext.subspec 'UIKit' do |ui|
          ui.source_files = 'LLGeneral/Classes/Extensions/UIKit/**/*'
      end
  end
  
  # s.resource_bundles = {
  #   'LLGeneral' => ['LLGeneral/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

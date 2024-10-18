#
# Be sure to run `pod lib lint LLGeneral.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LLGeneral'
  s.version          = '0.5.0'
  s.summary          = '常用代码库.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 常用代码封装, 扩展.
                       DESC

  s.homepage         = 'https://github.com/ZHK1024/LLGeneral'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { ' ZHK1024' => 'ZHK1024@foxmail.com' }
  s.source           = { :git => 'https://github.com/ZHK1024/LLGeneral.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  
  s.swift_version = '5.5'

  s.source_files = 'Source/LLGeneral/**'
  
  #**********************
  # Common
  s.subspec 'Common' do |com|
      com.subspec 'Defines' do |df|
          df.source_files = 'Source/LLGeneral/Common/Defines/**/*'
      end
  end
  
  #**********************
  # Math
  s.subspec 'Math' do |math|
      math.source_files = 'Source/LLGeneral/Math/**/*'
  end
  
  
  #**********************
  # PropertyWrapper
  s.subspec 'PropertyWrapper' do |pw|
      pw.source_files = 'Source/LLGeneral/PropertyWrapper/*'
  end
  
  #**********************
  # Extensions
  s.subspec 'Extensions' do |ext|
      # CoreGraphics
      ext.subspec 'CoreGraphics' do |cg|
          cg.source_files = 'Source/LLGeneral/Extensions/CoreGraphics/**/*'
      end
      
      # CoreImage
      ext.subspec 'CoreImage' do |ci|
          ci.source_files = 'Source/LLGeneral/Extensions/CoreImage/**/*'
      end
      
      # Foundation
      ext.subspec 'Foundation' do |fd|
          fd.source_files = 'Source/LLGeneral/Extensions/Foundation/**/*'
      end
      
      # UIKit
      ext.subspec 'UIKit' do |ui|
          ui.source_files = 'Source/LLGeneral/Extensions/UIKit/**/*'
      end
  end

  #**********************
  # UI

  s.subspec 'UI' do |ui|

    # LLGudie
    ui.subspec 'LLGudie' do |guide|
        guide.source_files = 'Source/LLGeneral/UI/LLGuide/*'
    end

    # LLAbout
    ui.subspec 'LLAbout' do |about|
        about.source_files = 'Source/LLGeneral/UI/LLAbout/**/*'
        about.dependency 'SnapKit'
#        about.dependency 'QMUIKit', '>= 4.1.3'
        about.dependency 'LLObject'
    end
    
    # Performance
    ui.subspec 'Performance' do |pf|
        pf.source_files = 'Source/LLGeneral/UI/Performance/**/*'
    end
    
    # PrivacyPolicy
    ui.subspec 'PrivacyPolicy' do |pp|
        pp.source_files = 'Source/LLGeneral/UI/PrivacyPolicy/**/*'
        pp.dependency 'LLObject'
    end
    
  end

  #**********************
  # File
  s.subspec 'File' do |file|
      file.source_files = 'Source/LLGeneral/File/**/*'
  end
  
  # s.resource_bundles = {
  #   'LLGeneral' => ['Source/LLGeneral/Assets/*.png']
  # }
  
  s.default_subspec = 'Math', 'Extensions', 'Common', 'PropertyWrapper'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


Pod::Spec.new do |s|

    s.name          = 'JJCTools'
    s.version       = '0.0.3'
    s.license       = { :type => 'MIT', :file => 'LICENSE' }
    s.summary       = 'A Library for iOS to  get result fasterly with some methods.'
    s.homepage      = 'https://github.com/jijiucheng/JJCTools'
    s.authors       = { '苜蓿鬼仙' => '302926124@qq.com' }
    s.source        = { :git => 'https://github.com/jijiucheng/JJCTools.git', :tag => s.version }
    s.platform      = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.framework     = 'UIKit'
    s.requires_arc  = true
    s.source_files  = 'JJCToolsDemo/JJCTools/.JJCTools.h'


# 子目录结构

    s.subspec 'JJCToolsObject' do |ss|
    ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsObject/*.{h,m}'
    end




end

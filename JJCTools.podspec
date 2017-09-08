
Pod::Spec.new do |s|

    s.name          = 'JJCTools'
    s.version       = '0.0.6'
    s.license       = { :type => 'MIT', :file => 'LICENSE' }
    s.summary       = 'A Library for iOS to  get result fasterly with some methods.'
    s.homepage      = 'https://github.com/jijiucheng/JJCTools'
    s.authors       = { '苜蓿鬼仙' => '302926124@qq.com' }
    s.source        = { :git => 'https://github.com/jijiucheng/JJCTools.git', :tag => s.version }
    s.platform      = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.framework     = 'UIKit'
    s.requires_arc  = true
    s.source_files  = 'JJCToolsDemo/JJCTools/JJCTools.h'


# 一级子目录结构

    s.subspec 'JJCToolsObject' do |ss|
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsObject/**/*.{h,m}'
        ss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsObject/**/*.{h}'
    end

    s.subspec 'JJCToolsCategory' do |ss|
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/*.{h,m}'
        ss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/*.{h}'

        # 二级子目录结构

        ss.subspec 'UITabBar' do |sss|
            sss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/UITabBar/**/*.{h,m}'
            sss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/UITabBar/**/*.{h}'
        end

        ss.subspec 'UIView' do |sss|
            sss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/UIView/**/*.{h,m}'
            sss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/UIView/**/*.{h}'
        end
    end


end

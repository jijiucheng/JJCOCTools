
Pod::Spec.new do |s|

    s.name          = 'JJCTools'
    s.version       = '1.0.0'
    s.license       = { :type => 'MIT', :file => 'LICENSE' }
    s.summary       = 'A Library for iOS to  get result fasterly with some methods.'
    s.homepage      = 'https://github.com/jijiucheng/JJCTools'
    s.authors       = { '苜蓿鬼仙' => '302926124@qq.com' }
    s.source        = { :git => 'https://github.com/jijiucheng/JJCTools.git', :tag => s.version }
    s.platform      = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    s.requires_arc  = true
    s.public_header_files = 'JJCToolsDemo/JJCTools/JJCTools.h'
    s.source_files  = 'JJCToolsDemo/JJCTools/JJCTools.h'
    s.resource      = 'JJCToolsDemo/JJCTools/JJCToolsResource/JJCTools.bundle'



# 一级子目录结构

    s.subspec 'JJCToolsOthers' do |ss|
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsOthers/**/*.{h,m}'
    end

    s.subspec 'JJCToolsDefine' do |ss|
        ss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsDefine/**/*.{h}'
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsDefine/**/*.{h,m}'
    end

    s.subspec 'JJCToolsObject' do |ss|
        ss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsObject/**/*.{h}'
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsObject/**/*.{h,m}'
        # pod成功的库，每个子文件夹都是对应一个子库，子库的目的是为了防止一个 kit 太大，把功能模块都分出来减少包体积；所以子库原则上是不进行相互依赖的；如果库中有必须依赖的话，可以通过该方式进行依赖；其中依赖的对应为 pod 成功后显示的库路径，非真实路径
        ss.dependency 'JJCTools/JJCToolsDefine'
    end


    s.subspec 'JJCToolsCategory' do |ss|
        ss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/**/*.{h}'
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsCategory/**/*.{h,m}'
        ss.dependency 'JJCTools/JJCToolsDefine', 'JJCTools/JJCToolsObject'
    end


    s.subspec 'JJCToolsView' do |ss|
        ss.public_header_files = 'JJCToolsDemo/JJCTools/JJCToolsView/**/*.{h}'
        ss.source_files = 'JJCToolsDemo/JJCTools/JJCToolsView/**/*.{h,m}'
        ss.dependency 'JJCTools/JJCToolsDefine', 'JJCTools/JJCToolsCategory'
    end




# 依赖第三方库文件
    s.dependency 'MBProgressHUD'


# 依赖系统静态库文件

    s.framework     = 'UIKit', 'Foundation', 'QuartzCore', 'CoreText', 'CoreGraphics'





end

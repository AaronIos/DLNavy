
Pod::Spec.new do |s|
    s.name         = 'DLNavy'
    s.version      = '0.0.1'
    s.summary      = 'iOS framework'
    s.homepage     = 'https://github.com/AaronIos/DLNavy'
    s.license      = 'MIT'
    s.authors      = {'Astraea尊' => 'swiftgodlike@163.com'}
    s.source       = {:git => 'https://github.com/AaronIos/DLNavy.git', :tag => s.version}
    s.framework  = "UIKit"
    s.source_files = 'Navy/**/*.{h,m}'
    s.requires_arc = true
end
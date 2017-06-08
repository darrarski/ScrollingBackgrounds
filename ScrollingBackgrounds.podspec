Pod::Spec.new do |s|
  s.name                  = 'ScrollingBackgrounds'
  s.version               = '1.0.0'
  s.summary               = 'UIScrollView backgrounds with dynamic layout'
  s.homepage              = 'https://github.com/darrarski/ScrollingBackgrounds'
  s.author                = { 'Dariusz Rybicki' => 'darrarski@gmail.com' }
  s.social_media_url      = 'https://twitter.com/darrarski'
  s.license               = { :type => 'MIT', 
                              :file => 'LICENSE' }
  s.source                = { :git => 'https://github.com/darrarski/ScrollingBackgrounds.git', 
                              :tag => "v#{s.version}" }
  s.platform              = :ios
  s.ios.deployment_target = '10.3'
  s.source_files          = 'ScrollingBackgrounds'
  s.requires_arc          = true
end

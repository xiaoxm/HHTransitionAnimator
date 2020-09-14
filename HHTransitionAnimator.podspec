#
# Be sure to run `pod lib lint HHTransitionAnimator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HHTransitionAnimator'
  s.version          = '0.1.1'
  s.summary          = '封装自定义转场动画'


  s.homepage         = 'https://github.com/xiaoxm/HHTransitionAnimator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'herui' => 'herui@ifensi.com' }
  s.source           = { :git => 'https://github.com/xiaoxm/HHTransitionAnimator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HHTransitionAnimator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HHTransitionAnimator' => ['HHTransitionAnimator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end

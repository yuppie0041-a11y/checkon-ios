platform :ios, '15.0'

target '마음안전365 체크온' do
  use_frameworks! :linkage => :static
  pod 'Firebase/Messaging'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      config.build_settings['SUPPORTS_MACCATALYST'] = 'NO'
    end
  end
end

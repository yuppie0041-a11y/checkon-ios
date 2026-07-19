# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

target '마음안전365 체크온' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Add the pod for Firebase Cloud Messaging
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
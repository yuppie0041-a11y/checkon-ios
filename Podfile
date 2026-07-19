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

  # Root cause fix: with static linkage, CocoaPods adds Pods_*.framework to the
  # app target's Frameworks Build Phase but never builds the aggregate target
  # (it is absent from xcodebuild's dependency graph), so the linker fails.
  # The individual pod frameworks are already linked via OTHER_LDFLAGS; the
  # aggregate wrapper is redundant and must be removed.
  require 'xcodeproj'
  user_project_path = File.join(File.dirname(__FILE__), '마음안전365 체크온.xcodeproj')
  user_project = Xcodeproj::Project.open(user_project_path)

  user_project.targets.select { |t| t.name == '마음안전365 체크온' }.each do |target|
    build_phase = target.frameworks_build_phase
    aggregate_files = build_phase.files.select { |f| f.display_name =~ /\APods_/ }
    aggregate_files.each do |build_file|
      file_ref = build_file.file_ref
      puts "[post_install] Removing #{build_file.display_name} from Frameworks Build Phase"
      build_file.remove_from_project
      file_ref&.remove_from_project
    end
  end

  user_project.save
  puts "[post_install] Saved project — aggregate pod framework removed"
end

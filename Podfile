# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'VerifyCodeSlideImage' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for VerifyCodeSlideImage
  pod 'NTESVerifyCode','3.4.4'
  
  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
  
end

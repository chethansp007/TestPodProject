# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'


target 'TestPodProject' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestPodProject

pod "KRProgressHUD"

end


post_install do |installer|
    
    puts 'Setting appropriate code signing identities'
    installer.pods_project.targets.each { |target|
        {
            'iPhone Developer' => ['Debug'],
            'iPhone Distribution' => ['Release', 'Staging', 'Production'],
        }.each { |value, configs|
            target.set_build_setting('CODE_SIGN_IDENTITY[sdk=iphoneos*]', value, configs)
        }
    }
    
end


class Xcodeproj::Project::Object::PBXNativeTarget
    
    def set_build_setting setting, value, config = nil
        unless config.nil?
            if config.kind_of?(Xcodeproj::Project::Object::XCBuildConfiguration)
                config.build_settings[setting] = value
                elsif config.kind_of?(String)
                build_configurations
                .select { |config_obj| config_obj.name == config }
                .each { |config| set_build_setting(setting, value, config) }
                elsif config.kind_of?(Array)
                config.each { |config| set_build_setting(setting, value, config) }
                else
                raise 'Unsupported configuration type: ' + config.class.inspect
            end
            else
            set_build_setting(setting, value, build_configurations)
        end
    end
    
end


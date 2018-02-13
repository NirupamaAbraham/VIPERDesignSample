# This lets cocoa pods know where to find the speficiations for the pods
source 'git@INMBZP4112.in.dst.ibm.com:mfiosdev/framework-specs.git'
source 'https://github.com/CocoaPods/Specs.git'
#source 'git@INMBZP4112.in.dst.ibm.com:apple-coc-frameworks-private/cocoapod-specs.git'

# Define each dependency and associated version for your application
target 'VIPERDesignSample' do
    pod 'AKNetworking', :git => 'git@INMBZP4112.in.dst.ibm.com:apple-coc-frameworks-private/aknetworking.git', :branch => 'feature/ios11_swift4.0'
end

# For applications which have other targets that require the same dependancies such as watch kit extensions that can be linked here
# link_with 'NurseTech', 'NurseTech WatchKit Extension'


# The rest of this specification is required is required for all mobile first cocoa pod specifications for swift frameworks

platform :ios, '9.0'
inhibit_all_warnings!
use_frameworks!

# By default cocopaod generates bundle identifiers with a generic "org.cocoapods" prefix. The following ruby code will change all these bundle identifiers to 'com.ibm.mobilefirst.*'.

post_install do |installer|

		 installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
            config.build_settings['CODE_SIGN_STYLE'] = "Automatic"
        end
    end

	# change bundle id of each pod to 'com.ibm.mobilefirst.*'
	bundle_id = 'com.ibm.mobilefirst.framework'

	directory = installer.config.project_pods_root + 'Target Support Files/'
	Dir.foreach(directory) do |path|

		full_path = directory + path
		if File.directory?(full_path)

			info_plist_path = full_path + 'Info.plist'
			if File.exist?(info_plist_path)

				text = File.read(info_plist_path)
				new_contents = text.gsub('org.cocoapods', bundle_id)
				File.open(info_plist_path, "w") {|file| file.puts new_contents }
			end
		end
	end
end


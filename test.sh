pod install

xcodebuild -workspace TestPodProject.xcworkspace -scheme TestPodProject -archivePath builds/TestPodProject.xcarchive archive

export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/
xcodebuild -exportArchive -exportOptionsPlist exportPlist.plist -archivePath builds/TestPodProject.xcarchive -exportPath builds

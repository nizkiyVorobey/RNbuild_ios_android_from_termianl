#!/bin/bash/

# $1 - Scheme (staging/production)
$targetScheme
projectName="ConnectMobile"

if [ $1 == "prod" ]; then
  targetScheme="AppProduction"
elif [ $1 == "staging" ]; then
  targetScheme="AppStaging"
elif [ $1 == "dev" ]; then
  targetScheme="AppDevelopment"
else
  echo $1 is invalid scheme
  exit
fi

cd ./ios && xcrun agvtool next-version -all && cd ../ # increment build

xcodebuild clean archive -workspace ios/$projectName.xcworkspace -scheme $targetScheme -archivePath /Users/$USER/Library/Developer/Xcode/Archives/$projectName.xcarchive | xcpretty && open ${HOME}/Library/Developer/Xcode/Archives/$projectName.xcarchive


# npx react-native run-ios --simulator="iPhone 11 Pro Max" --configuration Debug --scheme Production
#gem install xcpretty
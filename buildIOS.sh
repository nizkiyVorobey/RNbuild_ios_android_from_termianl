#!/bin/bash/

# $1 - Scheme (staging/production)
$targetScheme

if [ $1 == "prod" ]; then
  targetScheme="Production"
elif [ $1 == "stage" ]; then
  targetScheme="Staging"
else
  echo undefined scheme
  exit
fi

xcodebuild clean archive -workspace ios/interpreter4.xcworkspace -scheme $targetScheme -archivePath /Users/senyasenya/Library/Developer/Xcode/Archives/interpreter4.xcarchive | xcpretty

open ${HOME}/Library/Developer/Xcode/Archives/interpreter4.xcarchive


# npx react-native run-ios --simulator="iPhone 11 Pro Max" --configuration Debug --scheme Production
#gem install xcpretty
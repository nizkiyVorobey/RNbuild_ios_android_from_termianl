#!/bin/bash/
buildType=$1
scheme=$2

cd android
if [ $buildType == "apk" ]; then
  if [ $2 == "prod" ]; then
    ./gradlew assembleProductionRelease
    open app/build/outputs/apk/production/release
  elif [ $scheme = "staging" ]; then
    ./gradlew assembleStagingRelease
    open app/build/outputs/apk/staging/release
  else
    echo undefined scheme
    exit
  fi
elif [ $buildType == "bundle" ]; then
  if [ $scheme == "prod" ]; then
    ./gradlew bundleProductionRelease
    open app/build/outputs/bundle/productionRelease
  elif [ $scheme = "staging" ]; then
    ./gradlew bundleStagingRelease
    open app/build/outputs/bundle/stagingRelease
  else
    echo undefined scheme
    exit
  fi
fi

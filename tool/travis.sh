#!/bin/bash

# Fast fail the script on failures.
set -e -o pipefail

echo Fetch Dart channel: $CHANNEL

URL_PREFIX=https://storage.googleapis.com/dart-archive/channels/$CHANNEL/release/latest
DART_SDK_URL=$URL_PREFIX/sdk/dartsdk-linux-x64-release.zip
DARTIUM_URL=$URL_PREFIX/dartium/dartium-linux-x64-release.zip

npm install $DART_SDK_URL
npm install $DARTIUM_URL

echo Fetched new dart version $(<dart-sdk/version)

if [[ -n $DARTIUM_URL ]]; then
  mv dartium-* chromium
fi

sh -e /etc/init.d/xvfb start

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings \
  lib/*.dart \
  test/*.dart

# Run browser tests
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
pub run test -p dartium

# Verify the coverage of the tests.
if [ "$COVERALLS_TOKEN" ] && [ "$TRAVIS_DART_VERSION" = "stable" ]; then
  pub global activate dart_coveralls
  pub global run dart_coveralls report \
    --token $COVERALLS_TOKEN \
    --retry 2 \
    --exclude-test-files \
    test/all_test.dart
fi



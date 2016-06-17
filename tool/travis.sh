#!/bin/bash

# Fast fail the script on failures.
set -e

DART_DIST=dartsdk-linux-x64-release.zip
DARTIUM_DIST=dartium-linux-x64-release.zip

echo Fetching dart sdk and Dartium
curl http://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/$DART_DIST > $DART_DIST
curl http://storage.googleapis.com/dart-archive/channels/stable/raw/latest/dartium/$DARTIUM_DIST > $DARTIUM_DIST

unzip $DART_DIST > /dev/null
unzip $DARTIUM_DIST > /dev/null
rm $DART_DIST
rm $DARTIUM_DIST

mv dartium-* dartium;
mv dartium/chrome dartium/dartium;

export DART_SDK="$PWD/dart-sdk"
export PATH="$DART_SDK/bin:$PATH"
export DARTIUM_BIN="$PWD/dartium"
export PATH="$DARTIUM_BIN:$PATH"

echo Pub install
pub install

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings \
  web/*.dart \
  lib/*.dart \
  test/*.dart

# Verify that all the tests pass.
pub run test test/index.dart -p dartium

# Verify the coverage of the tests.
if [ "$COVERALLS_TOKEN" ] && [ "$TRAVIS_DART_VERSION" = "stable" ]; then
  pub global activate dart_coveralls
  pub global run dart_coveralls report \
    --token $COVERALLS_TOKEN \
    --retry 2 \
    --exclude-test-files \
    test/index.dart -p dartium
fi
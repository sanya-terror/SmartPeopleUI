#!/bin/bash

# Fast fail the script on failures.
set -e

DARTIUM_DIST=dartium-linux-x64-release.zip

echo Fetching Dartium
curl http://storage.googleapis.com/dart-archive/channels/stable/raw/latest/dartium/$DARTIUM_DIST > $DARTIUM_DIST

unzip $DARTIUM_DIST > /dev/null
rm $DARTIUM_DIST
mv dartium-* dartium;

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
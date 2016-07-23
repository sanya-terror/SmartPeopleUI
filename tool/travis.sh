#!/bin/bash

# Fast fail the script on failures.
set -e

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings \
  lib/*.dart \
  test/*.dart

# Run browser tests
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
pub run test -p firefox

# Verify the coverage of the tests.
if [ "$COVERALLS_TOKEN" ] && [ "$TRAVIS_DART_VERSION" = "stable" ]; then
  pub global activate dart_coveralls
  pub global run dart_coveralls report \
    --token $COVERALLS_TOKEN \
    --retry 2 \
    --exclude-test-files \
    test/all_test.dart
fi
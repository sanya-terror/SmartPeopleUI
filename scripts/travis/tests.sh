#!/usr/bin/env bash
set -e

export DARTIUM_PATH="$PWD/chromium"
export PATH=$PATH:$DARTIUM_PATH

# Run browser tests
pub run test -p dartium client\test\all_tests.dart

# Verify the coverage of the tests.
if [ "$COVERALLS_TOKEN" ] && [ "$TRAVIS_DART_VERSION" = "1.15.0" ]; then
  pub global activate dart_coveralls
  pub global run dart_coveralls report \
    --token $COVERALLS_TOKEN \
    --retry 2 \
    --exclude-test-files \
    client/test/all_test.dart
fi
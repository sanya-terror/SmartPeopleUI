#!/usr/bin/env bash

export DARTIUM_PATH="$PWD/chromium"
export DARTIUM_BIN="$DARTIUM_PATH/chrome"
export DARTIUM="$DARTIUM_PATH/dartium"

ln -s $DARTIUM_BIN $DARTIUM

export PATH=$PATH:$DARTIUM_PATH

echo Path $PATH

# Run browser tests
pub run test -p dartium

# Verify the coverage of the tests.
#if [ "$COVERALLS_TOKEN" ] && [ "$TRAVIS_DART_VERSION" = "1.15.0" ]; then
#  pub global activate dart_coveralls
#  pub global run dart_coveralls report \
#    --token $COVERALLS_TOKEN \
#    --retry 2 \
#    --exclude-test-files \
#    test/all_test.dart
#fi
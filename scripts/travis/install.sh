#!/bin/bash

# Fast fail the script on failures.
set -e

DARTIUM_DIST=dartium-linux-x64-release.zip

echo Fetching Dartium
curl http://storage.googleapis.com/dart-archive/channels/stable/raw/latest/dartium/$DARTIUM_DIST > $DARTIUM_DIST

unzip $DARTIUM_DIST > /dev/null
rm $DARTIUM_DIST

mv dartium-* chromium

export DARTIUM_PATH="$PWD/chromium"
export DARTIUM_BIN="$DARTIUM_PATH/chrome"
export DARTIUM="$DARTIUM_PATH/dartium"

ln -s $DARTIUM_BIN $DARTIUM

export PATH=$PATH:$DARTIUM_PATH

sh -e /etc/init.d/xvfb start

#!/usr/bin/env bash
set -e

cd client
dartanalyzer --fatal-warnings  --lints lib

cd ../server
dartanalyzer --fatal-warnings  --lints bin
dartanalyzer --fatal-warnings  --lints lib

cd ..

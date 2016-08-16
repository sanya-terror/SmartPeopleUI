#!/usr/bin/env bash
cd client
dartanalyzer --fatal-warnings  --lints lib
cd ..
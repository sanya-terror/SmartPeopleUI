#!/usr/bin/env bash
cd client
dartanalyzer --fatal-warnings  --lints lib

cd ../server
call dartanalyzer --fatal-warnings --lints bin
call dartanalyzer --fatal-warnings --lints lib

cd ../shared
call dartanalyzer --fatal-warnings --lints lib

cd ..
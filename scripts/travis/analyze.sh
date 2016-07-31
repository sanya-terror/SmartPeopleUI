#!/usr/bin/env bash

set -e

sh -e /etc/init.d/xvfb start

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings  --lints lib
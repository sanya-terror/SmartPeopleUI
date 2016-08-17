#!/usr/bin/env bash
pub run test:test  -p dartium client\test\all_tests.dart
pub run test:test  -p dartium shared\test\all_tests.dart
#!/usr/bin/env bash
pub global activate dart_style
dartfmt lib -w -l 120
dartfmt test -w - l 120
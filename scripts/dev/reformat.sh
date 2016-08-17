#!/usr/bin/env bash
pub global activate dart_style
dartfmt ../../client/lib -w -l 120
dartfmt ../../client/test -w -l 120
dartfmt ../../server/bin -w -l 120
dartfmt ../../server/lib -w -l 120
dartfmt ../../server/test -w -l 120
dartfmt ../../shared/lib -w -l 120
dartfmt ../../shared/test -w -l 120
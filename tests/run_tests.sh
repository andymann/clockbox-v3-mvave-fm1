#!/bin/sh
# SPDX-License-Identifier: MPL-2.0
# CLOCKBOX tests: build the host simulator and run the scripted checks (app/tests/basic.txt: timing, QRS, modes,
# settings, presets, tap tempo, follow modes, update mode), then the manual's screenshots (app/tests/screens.txt).
#   tests/run_tests.sh
set -e
cd "$(dirname "$0")/.."
./build.sh --host
OUT=app/build/host
"$OUT/clockbox_host" app/tests/basic.txt "$OUT"
"$OUT/clockbox_host" app/tests/screens.txt "$OUT"
echo "tests: ok"

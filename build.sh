#!/bin/sh
# SPDX-License-Identifier: MPL-2.0
# Build CLOCKBOX with fm1-base (base/tools/build.py). Used by the release workflow and `make fw`.
#   ./build.sh                    app/build/clockbox.fwsc  (dev identity FM-1_7700)
#   ./build.sh --host             the host simulator: app/build/host/clockbox_host
#   ./build.sh --web              the browser emulator: app/build/emu/
#   ./build.sh --release X.Y      app/build/clockbox-X.Y.fwsc
# PYTHON: the Python with Pillow (default: .venv/bin/python if present, else python3).
# On macOS the device build runs in Docker (linux/amd64); see base/README.md for the toolchain.
set -e
cd "$(dirname "$0")"
if [ -z "${PYTHON:-}" ]; then
    if [ -x .venv/bin/python ]; then PYTHON=.venv/bin/python; else PYTHON=python3; fi
fi
[ -f base/tools/build.py ] || { echo "build.sh: no fm1-base in base/ (git submodule update --init --recursive)"; exit 1; }
"$PYTHON" -c 'import PIL' 2>/dev/null || { echo "build.sh: $PYTHON has no Pillow (make venv)"; exit 1; }
exec "$PYTHON" base/tools/build.py app "$@"

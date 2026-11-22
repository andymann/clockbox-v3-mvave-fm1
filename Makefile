# CLOCKBOX for the M-VAVE FM-1. See README.md.
PY := $(if $(wildcard .venv/bin/python),$(CURDIR)/.venv/bin/python,python3)
export DYLD_FALLBACK_LIBRARY_PATH := /opt/homebrew/lib

.PHONY: venv toolchain fw host test web install release clean

venv:            ## Python env with Pillow (raqm), python-rtmidi, mido
	python3 -m venv .venv && .venv/bin/pip install -q pillow python-rtmidi mido

toolchain:       ## JieLi Linux toolchain + AC79 SDK files, hash-pinned (fm1-base's script)
	cd base && tools/setup_toolchain.sh --only jieli,ac79-sdk

fw:              ## app/build/clockbox.fwsc (macOS: Docker must be running)
	PYTHON=$(PY) ./build.sh

host:            ## host simulator + every scripted check (screenshots, WAVs in app/build/host)
	PYTHON=$(PY) tests/run_tests.sh

test: host

web:             ## browser emulator in app/build/emu (needs emcc)
	PYTHON=$(PY) ./build.sh --web

install:         ## flash app/build/clockbox.fwsc to a connected FM-1 over USB-MIDI
	$(PY) base/tools/fm1_install.py app/build/clockbox.fwsc

release:         ## make release V=0.1  ->  app/build/clockbox-0.1.fwsc
	PYTHON=$(PY) ./build.sh --release $(V)

clean:
	rm -rf app/build build

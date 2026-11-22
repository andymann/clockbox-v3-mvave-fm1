# CLOCKBOX (the app)

ClockBox v3 (https://github.com/Andymann/clockbox-v3) as an fm1-base app. User manual: [docs/MANUAL.md](docs/MANUAL.md).

| File | What |
|---|---|
| `app.c` | the clock engine (`app_tick`, 1 kHz timer interrupt), tap tempo, presets, QRS, follow modes, the sync pulses (`app_render`), the UI |
| `app.h` | the app's settings and its half of the contract with the platform |
| `fm1.toml` | build settings: name, package identity, USB names, Bluetooth (own stack), firmware.json |
| `words.tsv` | the screen reader's words |
| `tests/basic.txt` | host simulator checks of every feature (timing, QRS, modes, settings, presets, tap, follow, update mode) |
| `tests/screens.txt` | the manual's screenshots |
| `docs/MANUAL.md` | the user manual |
| `site/landing.md` | the site's front page (base/tools/make_site.py) |

Build and test from the repository root: `make host`, `make fw`, `make install` (see ../README.md).

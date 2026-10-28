# Space Travelers Universal Playlist - Core Algorithm & Predictor Engine

![Version](https://img.shields.io/badge/version-11.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-Tampermonkey%20%7C%20Violentmonkey-orange.svg)

## Overview

The **Space Travelers Universal Playlist Engine** (v11.0) is a userscript-driven system that couples continuous signal stream analysis with a 121-node harmonic grid. Designed around the **Span of Zero**, **Ternary Intent Logic**, and **Phi-attenuated weights**, it acts as a real-time predictor and verification framework for streaming telemetry data.

The engine is decoupled into two primary execution zones:
1. **Predictor Ingestion & Stream Analysis Zone (`PredictorZone`)**
2. **Core Algorithm Engine Zone (`CoreAlgorithmEngine`)**

---

## Key Features

- **121-Node Harmonic Grid ($\Phi$-weighted):** Uses the Golden Ratio ($\phi \approx 1.61803398875$) and sinusoidal mass attenuation across a 121-node grid to extract signal resonance.
- **Ternary Intent State Machine:** Evaluates velocity delta across trailing nodes (`117`, `118`, `119`) into three discrete intent states:
  - `State -1`: Sub-boundary Territory (Historical Paradigm Zone) — $| \Delta v | > 0.618$
  - `State  0`: Central Junction Zone (Evaluating the 120 Split / Deadlock) — $\Delta v = 0$
  - `State +1`: Post-boundary Territory (Pre-Deterministic Zone) — $0 < | \Delta v | \le 0.618$
- **ROM Checksum Verification:** Generates and validates receipts via a $60 \times 60$ lookup matrix to verify `NODE_120` standing wall boundaries.
- **HuggingFace Dataset Telemetry:** Automatically fetches benchmark data from `spanofzero/SpaceTravelersUniversalPlaylist` with automatic fallback to local signal buffers.

---

## Architecture & System Topology

```
                  ┌─────────────────────────────────────────┐
                  │ HuggingFace Benchmark Dataset Telemetry │
                  └──────────────────┬──────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ ZONE 1: PREDICTOR ZONE                                                  │
│  - Ingestion (121 signal rows)                                          │
│  - Trailing Predictors Extractor (Indices 117, 118, 119)                │
│  - Step Velocity Delta Calculation: Δv = (S[119] - S[117]) / 2           │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ ZONE 2: CORE ALGORITHM ENGINE                                           │
│  - Harmonic Weight Matrix: W_i = |sin((i+1) * Φ)| * (1 - i/121)         │
│  - Ternary Intent Evaluator (-1, 0, +1)                                 │
│  - ROM-60 Checksum & Receipt Generator                                  │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
                                     ▼
                      ┌──────────────────────────────┐
                      │    Window Bridge (API)       │
                      │  window.SpaceTravelersPlaylist│
                      └──────────────────────────────┘
```

---

## API Reference

Once installed, the userscript exposes `window.SpaceTravelersPlaylist` (or `unsafeWindow.SpaceTravelersPlaylist`) globally in your browser console or page context.

### Methods

#### `SpaceTravelersPlaylist.compute(signalArray)`
Calculates the total harmonic resonance score for an input numerical array.
- **Parameters:** `signalArray` (`number[]`)
- **Returns:** `number` (Resonance index)

```javascript
const signal = Array.from({ length: 121 }, () => Math.random());
const resonance = window.SpaceTravelersPlaylist.compute(signal);
console.log("Resonance Score:", resonance);
```

#### `SpaceTravelersPlaylist.analyze(signalArray)`
Runs full diagnostics on the signal stream, extracting velocity deltas and rendering the state boundary grid.
- **Parameters:** `signalArray` (`number[]`, optional)
- **Returns:** `string` (Formatted text report)

```javascript
console.log(window.SpaceTravelersPlaylist.analyze());
```

#### `SpaceTravelersPlaylist.generateReceipt(a, b, c)`
Generates a 2-character hex/symbol receipt string using the internal ROM-60 grid.
- **Parameters:** `a` (`number`), `b` (`number`), `c` (`number`)
- **Returns:** `string` (Receipt key, e.g., `"0A"`)

```javascript
const receipt = window.SpaceTravelersPlaylist.generateReceipt(12, 34, 56);
```

#### `SpaceTravelersPlaylist.validateReceipt(receipt, a, b, c)`
Validates an existing receipt against allocation parameters `(a, b, c)` and checks `NODE_120` standing wall status.
- **Parameters:** `receipt` (`string`), `a` (`number`), `b` (`number`), `c` (`number`)
- **Returns:** `string` (Validation message)

---

## Installation

1. Install a userscript manager extension such as [Tampermonkey](https://www.tampermonkey.net/) or [Violentmonkey](https://violentmonkey.github.io/).
2. Create a new script in your script manager.
3. Paste the source code from `space_travelers_engine.user.js`.
4. Save and enable the script. It will activate on all web pages (`*://*/*`).

---

## Diagnostic Output Example

Calling `SpaceTravelersPlaylist.analyze()` outputs a diagnostic block similar to:

```text
=== SPACE TRAVELERS UNIVERSAL PLAYLIST ENGINE ===
= farm.69.hens // Tri-Do-Domain Nomenclature Active
=<::♧.○.☆//GLYPH jump SPEED to node
=~:://634.343//8768.343//76788375.2
Core Algorithm State: [STATE 1] -> Post-boundary Territory (Pre-Deterministic Zone)
Velocity Delta (Indices 117-119): 0.2314
Standing Wall Boundary (||): Immutable Path

<.........<.........<.........<.........<.........<.........<.........<.........<.........<.........<.........<......... [NODE_120] 

Span of Zero Anchor (@) Resolved.
```

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
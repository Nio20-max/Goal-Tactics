# Target Architecture

## Goal

Build a replacement Android client that:

- does not depend on Xamarin or Mono at runtime,
- matches the old UI as closely as practical,
- speaks to the rebuilt Goal Tactics backend,
- remains maintainable after the initial parity push.

## Recommended Technical Choice

### Primary recommendation

Use a native Android stack:

- Kotlin
- Android SDK Views/XML
- RecyclerView-based lists and table-like components
- custom views for legacy widgets that have distinctive behavior

### Why not start with Jetpack Compose

Compose is a good long-term UI technology, but it is not the best first move if the top priority is reproducing the old app closely.

The recovered legacy client already maps naturally to Android XML and imperative view wiring:

- XML layouts exist in the decoded APK resources
- screen composition is built around `SetContentView(...)`, `LayoutInflater.Inflate(...)`, and `FindViewById(...)`
- custom widgets are implemented in platform-specific view classes in `GT.Droid`

Compose can still be introduced later for new screens or component migration after parity is stable.

## Product Constraints

The rebuild should assume:

- Android is the only required target for Phase 1 of the replacement app
- the backend contract is the recovered `/api/*` plus `/chat` and `/auc`
- the original APK is the reference implementation for layout, navigation, and screen-state behavior
- the visual target is high-fidelity imitation, not reinterpretation

## Non-Goals

These items are explicitly out of scope for the first rebuild cycle:

- reproducing the original Xamarin project layout
- preserving third-party SDK behavior exactly if those SDKs are obsolete or unnecessary
- redesigning the UI into a more modern style
- introducing a cross-platform framework before Android parity exists

## App Layers

The rebuild should be organized into these layers:

### 1. `app-shell`

Responsibilities:

- startup flow
- root navigation
- tab or section shell
- loading overlays
- badge counters
- global toasts/popups/dialogs

### 2. `ui-kit`

Responsibilities:

- reusable buttons, bars, list rows, countdowns, badges, dialogs
- typography and spacing tokens
- colors, backgrounds, status chips, icon handling
- custom widgets matching the old app's distinctive controls

### 3. `feature-screens`

Responsibilities:

- Club
- Finances
- Stadium
- Squad
- Lineup
- Training
- Scouting
- Transfer Market
- League
- Ladder
- Friends
- Chat
- Live
- Shop
- Support

### 4. `data-and-sync`

Responsibilities:

- API client
- hub connections
- request/response mapping
- retry and reconnect behavior
- cache and state restoration where needed

### 5. `parity-harness`

Responsibilities:

- screenshot baselines
- UI tree capture
- golden tests
- state fixtures and mock responses for screen reconstruction

## Delivery Strategy

The rebuild should not wait for the full backend to be perfect.

It should use three execution modes:

1. design-only mode
   - static UI reconstruction from layouts, assets, and strings
2. fixture mode
   - local JSON fixtures and mocked responses to unlock screens and states
3. live mode
   - real backend integration for parity validation

## Decision Rule

When parity and engineering elegance conflict during the first rebuild pass, choose parity first unless the old behavior is clearly broken or blocks maintainability severely.
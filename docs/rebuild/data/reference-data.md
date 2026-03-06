# Reference Data (Phase 0)

## Phase 0 Step Log
1. Extracted known definition containers from decompiled `JsonDefinitions` and `JsonSettings` usage.
2. Enumerated static data needed for deterministic backend bootstrap.
3. Tagged which values are server-managed versus app display labels.

## Exact from client/docs
Reference groups expected by client:
- countries
- match systems/formations and field layout
- tactics
- match positions
- match event types
- league hierarchy metadata
- mail types
- shirts/emblems
- mood modifiers
- game parameters
- costs and dates settings

## Exact from decompiled logic
`JsonDefinitions` includes arrays for:
- seasons, championships, league hierarchies
- countries
- match types/tactics/events/systems/positions/system fields/directions
- mail types
- trikot and emblem definitions
- mood modifiers
- parameters

`JsonSettings` includes:
- `Costs` (`JsonCosts`)
- `Dates` (`JsonDates`)

## Fallback model selected after testing
- None for data categories.
- Actual numeric values for some parameters still require extraction from historical server outputs or user samples.

## Bootstrap requirement
On environment init, seed at least:
- countries with ids and display names
- formation templates and field slots
- tactic ids and names
- base mood modifier thresholds
- base cost settings (`PlaceBid`, `YouthCosts`, `SpecialScoutSpeedupCosts`, etc.)
- product and equipment catalog entries

## Simulated walkthrough
Reference update cycle:
1. Deploy new backend with versioned `reference_data_version`.
2. Client calls definitions/settings refresh path.
3. Backend returns definitions/settings payload matching expected contract.
4. Client updates local cache and rebinds UI labels/limits.

What this accomplishes:
- keeps client UI and backend rule boundaries aligned without app re-release for every minor cost tweak.

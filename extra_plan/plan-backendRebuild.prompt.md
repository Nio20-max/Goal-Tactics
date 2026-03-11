## Plan: Backend Rebuild from Traffic Logs

TL;DR: Use the original API traffic under `information/original_API_requests` as the canonical specification for every game mechanic. 1) Scan and catalogue endpoints and JSON structures to build a comprehensive `GameSpec` inventory. 2) Derive formulas (player strength, match simulation, training gain/loss, auction pricing, etc.) from sample request/response pairs and any helper scripts/data already in the repo. 3) Implement a new backend project or extend the existing `GoalTactics.*` services to faithfully reproduce behaviour, guided by the inventory and formulas. 4) Add thorough unit/integration tests that replay captured traffic and verify identical outputs. 5) Provide a special "rebuild" tool that re‑runs the analysis when additional captures are added.

**Steps**

1. **Log analysis & inventory ("every aspect" step)**
   1.1. Recursively parse all `sslCaptureData_*.txt` files in `information/original_API_requests/logs/*` and extract every HTTP request/response.
   1.2. Build a catalog of unique endpoints, verbs and request/response JSON schemas.  Include SignalR hubs and any non‑HTTP flows.
   1.3. Cross‑reference this catalog with the existing `api-endpoints-and-response-contracts.md` document in `reports_and_plans/game_analysis/game_analysis/`.  For each endpoint listed in the markdown, search the parsed log entries for at least one matching request (by HTTP method and path).  Mark endpoints that have no corresponding log entry as “missing from captures.”
   1.4. Annotate the catalog with the game feature implied by each endpoint (e.g. `/api/Match/Simulate` → match simulation; `/api/Team/GetMyResources` → resources; `/api/Auction/Bid` → auction, etc.).
   1.5. Identify numeric fields that look like strengths, ratings, prices, capacities, positional attributes, etc., and record sample values.  This will be the primary source for formula discovery.
   1.6. During cataloging, flag any endpoints or fields where the meaning is unclear or where no sample exists; these will require manual follow‑up or network captures from a running client.

2. **Reverse‑engineer formulas & business logic**
   2.1. For each numeric field that participates in a mechanic (player strength, team strength, match outcome, training progress, injury duration, stadium attendance, auction settlement, contract valuations, etc.), collect all observed input/output tuples from the logs.
   2.2. Reuse or adapt existing tools such as `tools/phase0/collect_formula_samples.py` and `tools/phase0/simulate_phase0_formulas.py` to help fit candidate mathematical models (linear, polynomial, piecewise, random distribution).
   2.3. Pay special attention to the player strength formula: use captured player attributes (speed, stamina, technique, age, etc.) and the reported `strength` value to infer the weighting and aggregation method.
   2.4. Similarly infer team‑strength aggregation (starting lineup vs squad average, fitness, tactic bonus), match simulation rules (goal probability, fatigue adjustment), training gains, injury probabilities/durations, contract evaluation, transfer/auction pricing rules, stadium attendance formula, VIP/hospitality revenue, and resource costs.
   2.5. Document all deduced formulas and the confidence level; where the log data alone is insufficient, note assumptions or mark as "needs manual calibration."

3. **Backend implementation**
   3.1. Decide whether to extend the existing solution (`GoalTactics.Api`, `Application`, etc.) or create a fresh `GoalTactics.Rebuilt` project.  The plan targets either case but stresses clean separation so the new code can be validated independently.
   3.2. Create domain classes and DTOs for all request/response types identified in step 1 (use the catalog as source of truth).  Preserve field names exactly to ease replay tests.
   3.3. Implement services for each game subsystem: `TeamService`, `MatchService`, `TrainingService`, `AuctionService`, `ContractService`, `StadiumService`, `BotService`, etc., with methods reflecting the endpoints.
   3.4. Implement the formulas derived in step 2 inside these services.  For stochastic components (injuries, match events) use seeded randomness so tests can reproduce sample traffic.
   3.5. Add configuration flags or interfaces to allow formula tweaks (for later balancing) but default to the reverse‑engineered behavior.
   3.6. Ensure the SignalR hubs (`chat`, `auc`, etc.) can serialize/deserialize the captured payloads exactly; replicate any custom message types seen in the captures.

4. **Testing & verification**
   4.1. Write unit tests for each formula with the observed input/output pairs as assertions; add new samples if additional captures are acquired.
   4.2. Build a traffic‑replay harness: read each captured HTTP exchange and replay it against the new backend, comparing the backend's response body byte‑for‑byte (ignoring signatures/timestamps) to the recorded response.  Fail the test suite when deviations occur.
   4.3. Add integration tests that construct representative game states (using services rather than replaying full logs) and verify long‑running flows (e.g. simulate a full match, run through an auction, process daily resource update).
   4.4. Run `dotnet test GoalTactics.slnx` plus any new tests to ensure existing infrastructure remains functional.
   4.5. Manual sanity check: start the backend locally, configure a small proxy to feed live mobile‑client traffic, and watch logs to ensure identical responses are returned in real time.

5. **Utility and maintenance**
   5.1. Add a command‑line analysis tool (possibly in `tools/` or as a new executable in `src/GoalTactics.Tools`) that re‑parses the `information/original_API_requests` directory and updates the catalog/formula database.  This allows future captures to be added and automatically inspected.
   5.2. Document the rebuild process in `docs/rebuild/README.md` (or similar) summarizing how to obtain new traffic captures, run the analysis tool, and update formulas.
   5.3. Create a migration/upgrade guide for the frontend clients, since the rebuilt backend may expose the same API but may behave slightly differently; include notes on preserving backward‑compatibility.

**Relevant files**
- `information/original_API_requests/logs/*` — raw traffic used as specification.
- `tools/phase0/*` — existing formula‑sampling helpers; extend as needed.
- `src/GoalTactics.*` (various) — current backend code which may be partially reused or serve as reference for naming/conventions.
- `docs/rebuild/` (new) — documentation of rebuild steps.

**Verification**
1. Catalog generation script produces a human‑readable inventory containing every endpoint and schema seen; inspect it to confirm coverage.
2. Formula unit tests pass and reproduce every sample in the log dataset.
3. Traffic‑replay tests run through all captured exchanges without mismatches.
4. `dotnet test` (existing + new) passes at 100%.
5. Local run of the API with real client traffic yields identical responses as recorded in the original captures (modulo auth tokens).  

**Decisions & assumptions**
- The traffic logs are treated as the authoritative spec; any behaviour not represented there must be inferred or requested from the user.
- A new analysis tool simplifies later expansions but is optional; the same deductions could be performed manually.
- Backward compatibility with the old API is paramount, so field names and HTTP routes are not changed unless a compelling reason arises.
- Stochastic mechanics will be deterministic during tests via seeded RNG; production can opt for true randomness configurable by environment.

**Further considerations**
1. Some aspects like the in‑game economy or bot AI may not appear in simple request/response pairs; additional captures or source code from the original client may be needed.
2. The user should verify whether any server‑side secret (signing key, encryption) is required to mimic requests; the plan assumes responses can be generated without reproducing signature algorithms.
3. If the rebuild is intended for live service (not just analysis), performance and scalability (DB schema, caching, etc.) must be addressed separately; this plan focuses on functional fidelity.
4. The games' anti‑cheat or authentication flows may require special handling not covered by traffic logs.
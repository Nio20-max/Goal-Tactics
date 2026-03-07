# Goal Tactics Android Crash Regression Report

Date: 2026-03-07

## Scope

This report explains the direct-crash regression that appeared after the startup-bypass experiment on the legacy Xamarin.Android client. It also separates that regression from two earlier issues that happened in the same investigation:

1. stale backend URLs inside managed assemblies,
2. an earlier assembly-store rebuild bug that caused a Mono/Xamarin loader fatal,
3. a later stable-but-hanging build that stayed alive behind the Android starting window and produced no backend traffic.

The goal here is precision. This document distinguishes between confirmed facts, high-confidence inferences, and unresolved items.

## Short Conclusion

The latest direct crash was not caused by the replacement backend and not by general device connectivity. It was most likely caused by the experimental GT.Droid assembly rewrite path, which moved the APK from a structurally valid but logically stuck state into a structurally invalid Xamarin runtime load state.

More specifically:

- The GT.Core-only URL patch path was relatively conservative and produced a last known stable baseline.
- The earlier fatal assembly-store issue was traced to a rebuild bug in assemblies.blob handling, where compressed XALZ entries lost their original descriptor index during recompression.
- That bug was fixed, and the resulting baseline APK no longer died immediately in the loader.
- The later startup-bypass experiment modified GT.Droid.dll method bodies and constructors, then reinjected that rewritten assembly into the Xamarin assembly store.
- After that step, the app regressed to a direct crash. The most plausible cause is that the repackaged GT.Droid image no longer satisfied Xamarin assembly-store/runtime assumptions, even though the APK could still be built, signed, and installed.

This means the final regression was a loader/integrity problem in the managed assembly packaging path, not an HTTP routing problem.

## Evidence Levels

### Confirmed facts

- The codebase contains fixed-width URL replacement logic for the old Goal Tactics backend endpoints in GT.Core-related payloads.
- The assembly-store rebuild script explicitly parses XALZ-compressed entries and now preserves the original descriptor index when recompressing them.
- There was a last known non-crashing compatibility build after the descriptor-index fix: `analysis/phase3_compat/out/GoalTactics-compat-debug-fixed.apk`.
- Decompiled GT.Droid startup code shows that `MainActivity.OnCreate` performs several early initialization steps before the UI is fully established, including `InitializeHelpshift()`, `InitializeFacebookSDK()`, `URLHelper.Load()`, `RegisterServices()`, `SetContentView(...)`, `InitNavigation()`, and `InitShell()`.
- The GT.Droid startup-bypass experiment changed real IL, not just string literals. The patcher can replace `MainActivity.InitializeHelpshift` with `ret` and replace selected analytics-service constructors with a base-constructor call followed by `ret`.
- The stable baseline still produced no Goal Tactics backend traffic during the splash/hang state.
- The later experimental APK was reported to crash directly.

### High-confidence inferences

- The stable splash/hang and the later direct crash were different failure classes.
- The direct crash happened earlier in startup than the splash/hang, likely before the app reached any meaningful backend bootstrap path.
- The GT.Droid rewrite path increased structural risk significantly compared with GT.Core fixed-width string replacement.
- Xamarin's loader/runtime constraints are stricter than simple "valid IL" or "APK installs successfully" checks.

### Unresolved items

- The exact app-level reason for the stable baseline hanging behind the starting window was not fully isolated.
- The exact loader-side invariant violated by the rewritten GT.Droid payload was not independently proven from a fresh device log after the final regression, because the device was disconnected before that validation step.

## Timeline

### Phase 1: Backend host patching

The original client still referenced legacy backend URLs. The first task was to redirect managed URL literals to the replacement host.

Two implementation paths existed:

- direct fixed-width payload patching in the assembly-store rebuild script,
- Mono.Cecil-based assembly rewriting in `tools/AssemblyUrlPatcher/Program.cs`.

The URL replacements themselves were straightforward:

- old engine endpoints were redirected to `https://<host>/api/`,
- old web endpoints were redirected to `https://<host>/`.

At this stage, the intended outcome was only to change where the client talks, not how it starts.

### Phase 2: First loader crash

An earlier patched build failed with a Xamarin/Mono fatal related to the assembly store. This was not a backend failure. It happened before any backend request mattered.

The important discovery was in the assembly-store rebuild logic:

- compressed images in `assemblies.blob` use an `XALZ` header,
- that header includes a descriptor index and the uncompressed length,
- the rebuild path had been recompressing data while writing a descriptor index of `0` instead of preserving the original value.

That meant the rebuilt `assemblies.blob` was structurally wrong for Xamarin's runtime expectations even if the contained managed payload was otherwise readable.

### Phase 3: Structural repair and stable baseline

The rebuild script was corrected so that:

- `decompress_image(...)` returns the original descriptor index,
- `compress_image(raw, descriptor_index)` writes that same index back into the XALZ header,
- the blob is then rebuilt with recalculated offsets but without losing the entry-level compression metadata.

After that fix, the compatibility APK stopped exhibiting the earlier immediate loader fatal. The resulting baseline was `analysis/phase3_compat/out/GoalTactics-compat-debug-fixed.apk`.

This point is critical because it establishes a clean separation:

- before the descriptor-index fix, the package was structurally invalid at loader time,
- after the fix, the package was structurally valid enough to keep the process alive.

### Phase 4: Stable process, no backend traffic, splash hang

Once the loader fatal was removed, the problem changed.

The app no longer died immediately. Instead, it stayed alive while appearing stuck behind the Android starting window or splash-like state, and nginx showed no Goal Tactics traffic.

That changed the diagnostic picture:

- backend reachability from the device was not the immediate blocker,
- URL patching alone was not sufficient to complete startup,
- some earlier application initialization or UI/bootstrap step was likely preventing the app from reaching its normal authenticated flow.

The decompiled startup path supports that interpretation. `MainActivity.OnCreate` performs a large amount of work synchronously and early:

- third-party SDK initialization,
- service registration,
- UI inflation,
- navigation setup,
- shell setup,
- resource bar and main menu initialization.

Separately, GT.Core contains `URLHelper.CheckNetworkState()`, which can loop until network access is considered available and display repeated popup messages. That function remained a plausible app-level gate, but it was not proven to be the sole cause of the splash hang.

### Phase 5: Startup-bypass experiment

Because the stable baseline was still stuck, the next experiment targeted suspicious early startup integrations in GT.Droid.

`tools/AssemblyUrlPatcher/Program.cs` was extended to support three optional behavior-changing rewrites:

- `--disable-helpshift`
- `--disable-appcenter`
- `--disable-appsflyer`

These were not string substitutions. They changed executable code:

- `ReplaceMethodWithReturn(MethodDefinition method)` clears the method body and emits only `ret`.
- `ReplaceConstructorWithBaseCall(MethodDefinition method)` clears the constructor body, calls the parameterless base constructor, and returns.

The specific targeted rewrites were:

- `MainActivity.InitializeHelpshift()`
- parameterless `AppCenterAnalyticsService` constructors
- one-argument `AppsFlyerAnalyticsService` constructors

This was the turning point where the patching strategy changed from relatively shape-preserving edits to invasive IL surgery inside GT.Droid.

### Phase 6: Direct-crash regression

After the GT.Droid startup-bypass path was built, repackaged into the assembly store, and installed as a new APK variant, the user reported that the app now crashed directly.

That regression is best explained as follows:

1. the descriptor-index problem had already been solved,
2. therefore the new direct crash was not just a reappearance of the old bug from the unfixed rebuild script,
3. the major new variable was the rewritten GT.Droid assembly,
4. that rewrite likely changed the managed image enough that the rebuilt assembly store was no longer acceptable to Xamarin's runtime loader,
5. because this kind of failure happens before normal application startup completes, backend traffic remained irrelevant to the immediate symptom.

## Technical Basis For The Conclusion

### 1. The conservative path and the invasive path were different in risk

The GT.Core host patching path was careful in two ways:

- it used fixed-width replacements where possible,
- it mainly altered string data rather than reshaping control flow.

That matters because fixed-width string replacement is much less likely to perturb metadata, instruction layout, method-body structure, or other runtime-sensitive assembly characteristics.

By contrast, the GT.Droid startup-bypass path deliberately replaced method bodies and constructors. Even when the resulting IL is individually valid, that does not guarantee that the reserialized assembly will still fit every assumption encoded into Xamarin's assembly-store loading pipeline.

### 2. "APK builds and installs" was not a sufficient correctness check

The Android packaging toolchain validated only part of the stack:

- ZIP/APK integrity,
- resource packaging,
- signature correctness,
- installability on device.

It did not prove that Xamarin's managed runtime would accept the rewritten assembly-store payload at startup.

That distinction explains why a package can be successfully rebuilt and signed yet still die before reaching normal app code.

### 3. The regression point lines up with the GT.Droid rewrite, not with networking

If the replacement backend were the primary cause of the final direct crash, the expected symptom would be a later failure during authentication, API calls, or app bootstrap. Instead, the observed symptom changed into an immediate crash after the assembly rewrite experiment.

That symptom timing fits a loader/integrity failure much better than an HTTP or DNS failure.

### 4. The stable splash hang actually strengthens the loader-regression diagnosis

The stable baseline matters because it proves that the earlier descriptor-index repair had already moved the APK past the original assembly-store loader fatal. The process staying alive means the package was at least loadable enough for startup code to begin executing.

Once the GT.Droid rewrite was introduced and the app regressed to a direct crash, the most credible interpretation is not "the backend got worse" but "the package stopped being safely loadable again."

## What Exactly Went Wrong

The failure was not one single mistake. It was a stack of three different issues, and treating them as one problem would hide the actual cause of the final regression.

### Issue A: legacy service endpoints in managed code

The original client still pointed at retired infrastructure. That required patching and was a genuine functional problem.

However, that issue does not explain an immediate loader-level crash.

### Issue B: incorrect reconstruction of compressed assembly-store entries

This was the first structural packaging bug. Recompression lost the original XALZ descriptor index, which made the rebuilt store invalid for Xamarin runtime loading.

That bug was real, confirmed, and fixed.

### Issue C: experimental GT.Droid startup bypassing introduced a new structural risk

After Issue B was fixed, the project moved to a more aggressive experiment: rewriting GT.Droid startup methods and constructors to skip third-party initialization.

That introduced a new failure mode:

- the patched GT.Droid assembly was no longer just data-equivalent with different URLs,
- it was now a materially different managed binary,
- it still had to be accepted by the legacy Xamarin assembly-store/runtime path,
- and that path appears to have stricter expectations than the experiment preserved.

This is the most precise explanation for why the app transitioned from "alive but stuck" to "crashes directly."

## What The Evidence Does Not Support

The current evidence does not support these claims:

- that nginx routing or the replacement backend directly caused the final immediate crash,
- that DNS or device internet connectivity was the main cause of the direct-crash regression,
- that the stable splash hang and the later direct crash were the same bug,
- that disabling Helpshift/AppCenter/AppsFlyer was semantically proven wrong at the app-logic level.

The stronger claim is narrower and better supported:

- the packaging and runtime consequences of rewriting GT.Droid were unsafe for this legacy Xamarin assembly-store deployment model.

## Most Likely Root Cause Statement

The most likely root cause of the final direct crash was that the startup-bypass experiment rewrote GT.Droid.dll in a way that produced a managed payload the legacy Xamarin.Android assembly-store loader no longer accepted at runtime, even though the APK could still be rebuilt, signed, and installed successfully.

## Contributing Factors

- The application uses a legacy Xamarin/Mono deployment model with hidden runtime assumptions that are stricter than normal .NET IL validity checks.
- The assembly-store format is not self-describing enough at the APK packaging layer to catch all loader incompatibilities early.
- The investigation had two active goals at once: redirect backend traffic and bypass early startup blockers. That increased the chance of changing both behavior and packaging invariants in the same iteration.
- The stable splash hang created pressure to make more invasive edits before the app-level blocker was fully isolated.

## Non-Causes For The Final Direct Crash

Based on the evidence available, these were not the primary cause of the final direct-crash regression:

- the mere existence of old backend URLs,
- lack of backend traffic during the stable splash-hang phase,
- ordinary server-side API errors,
- simple HTTPS reachability from the device.

## Remaining Unknown

The major unresolved question is still the stable baseline hang.

That problem remained after the descriptor-index fix and before the GT.Droid startup-bypass regression. It likely lives in one of these areas:

- early third-party SDK initialization,
- service registration side effects,
- navigation or shell initialization,
- a UI state that never clears `IsLoadingScreenVisisble`,
- an auth/bootstrap gate that does not progress even though the process remains alive.

But that unresolved hang should be treated as a separate problem from the final direct crash.

## Practical Takeaway

The safest known baseline is the descriptor-index-fixed build, not the startup-bypass build. If future work resumes, the correct approach is to treat the last stable APK as the recovery point and investigate the splash hang without further GT.Droid binary-shape changes until a safer assembly-preservation strategy is available.

In other words:

- the backend patching problem was real,
- the first assembly-store bug was real and fixed,
- the later direct crash was introduced by the more invasive GT.Droid rewrite path,
- and the stable splash hang still needs its own separate investigation.
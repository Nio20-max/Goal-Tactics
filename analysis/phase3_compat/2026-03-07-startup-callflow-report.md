# Goal Tactics Startup Callflow Report

Date: 2026-03-07

## Scope

This report traces the legacy Xamarin.Android client startup path from the Android entrypoint into the first UI and backend gates. It focuses on the code and artifacts that are present in this repository:

- `analysis/phase3_compat/apk_dec/AndroidManifest.xml`
- `reverse_engineering/decompiled/GT.Droid.actual/GT.Droid.decompiled.cs`
- `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`
- `tools/AssemblyUrlPatcher/Program.cs`
- `tools/patch_xamarin_assembly_store_urls.py`

The goal is precision about call order, data flow, and likely startup failure modes.

## Entry Point

The Android manifest declares `crc645877ad3d44b9b81b.MainActivity` as the launcher activity. That Java class is only the Xamarin registration wrapper. The real managed implementation is `GT.Droid.MainActivity` in the decompiled GT.Droid payload.

Startup therefore follows this chain:

1. Android launches `crc645877ad3d44b9b81b.MainActivity`.
2. Xamarin runtime resolves that registration to `GT.Droid.MainActivity`.
3. `GT.Droid.MainActivity.OnCreate(Bundle savedInstanceState)` begins the app-managed startup sequence.

## MainActivity.OnCreate Sequence

The decompiled `OnCreate` method executes the following sequence synchronously and very early:

1. `base.OnCreate(savedInstanceState)`
What it does:
Initializes the Android activity base state.
Possible errors:
Any loader or activity-construction failure before this point is outside app logic and points to Xamarin/runtime packaging problems.

2. `Platform.Init(this, savedInstanceState)`
What it does:
Initializes Xamarin Essentials platform wiring.
Possible errors:
If the Xamarin runtime, Android context, or registered activity state is inconsistent, startup can fail here before any backend logic runs.

3. `InitializeHelpshift()`
What it does:
Calls `HelpshiftCore.Initialize(...)`, builds a `HelpshiftInstallConfig`, and immediately calls `HelpshiftCore.Install(...)` with hard-coded credentials.
Possible errors:
- SDK initialization exceptions.
- Installation-time validation or environment issues.
- Blocking or unexpected behavior before the app UI is inflated.

4. `InitializeFacebookSDK()`
What it does:
Creates `FacebookCallbackManager` with `CallbackManagerFactory.Create()`.
Possible errors:
- Missing SDK state or dependency mismatch.
- Any exception here aborts `OnCreate` because the call is not guarded.

5. `Platform.AppContext` and `Platform.CurrentActivity`
What it does:
Forces platform context initialization.
Possible errors:
- Context initialization issues surface here if platform state is incomplete.

6. `URLHelper.Load()`
What it does:
Reads `use_prod` from preferences into `URLHelper.UseProd` and logs the selected backend URLs.
Data flow:
- Preference key `use_prod` drives whether `BaseServiceUrl` and `NewBackendUrl` point at production or staging endpoints.
- Patched compatibility builds depend on the URL literals inside GT.Core having already been rewritten to the replacement host.
Possible errors:
- No immediate crash risk is visible in the code itself.
- A wrong literal patch does not usually crash here; it causes later network misrouting.

7. `RegisterServices()`
What it does:
Builds the global component registry used for nearly everything that follows.
Data flow:
- Registers platform services, popup service, credential/auth services, navigation, shell abstraction, feature services, and all major view models.
- Registers analytics providers by constructing `AppCenterAnalyticsService()` and `AppsFlyerAnalyticsService(this)` immediately.
Possible errors:
- Constructor exceptions in any registered concrete service abort startup.
- `AppCenterAnalyticsService()` calls `AppCenter.Start(...)` immediately.
- `AppsFlyerAnalyticsService(this)` stores the activity, calls `AppsFlyerLib.Instance.Init(...)`, then `Start(...)` immediately.
- Because these analytics objects are constructed inline, failures occur before the main layout is fully usable.

8. `ComponentFactory.Resolve<ISoundManager>()`
What it does:
Pulls the sound manager from the registry.
Possible errors:
- Any registration defect from the previous step surfaces here as resolution failure.

9. `SetContentView(...)`
What it does:
Inflates the main activity layout.
Possible errors:
- Resource mismatch or invalid view inflation crashes here.
- If startup dies before this line, the user sees only the Android starting window or an immediate crash.

10. `FindViewById(...)` wiring block
What it does:
Finds core containers, loading widgets, chat/help/menu buttons, and binds click handlers.
Possible errors:
- Missing or mismatched resource IDs would raise null-related failures when event handlers or property setters run.
- The code assumes the layout and IDs are intact.

11. `ComponentFactory.Resolve<ShellViewModel>()` and binding setup
What it does:
Creates the shell binding context and binds the loading image and version label to `IsLoadingScreenVisisble`.
Data flow:
- The loading overlay remains visible until later view-model updates set `IsLoadingScreenVisisble = false`.
Possible errors:
- Resolution or binding failures prevent the shell from controlling the startup overlay.

12. `HideTopBar()` and `HideNavigationBar()`
What it does:
Hides shell chrome before the first screen is selected.
Possible errors:
- Low direct crash risk; mostly a UI state concern.

13. `InitNavigation()`
What it does:
Resolves `INavigationService`, registers every screen identifier to its view type, and prepares later navigation.
Possible errors:
- A missing registration or broken view type causes later navigation failures.
- These failures may appear after startup rather than directly inside `OnCreate`.

14. `InitShell()`
What it does:
Calls `ComponentFactory.Resolve<IShell>().SetCurrentShell(this)`.
Data flow:
- This connects the abstract shell service to the live activity instance.
- If this does not happen, shell operations log `!!! Current shell view was not set !!!` and no-op.
Possible errors:
- Shell resolution failure.
- If the shell is never set, later progress, notification, and menu updates silently fail.

15. `InitImagePaths()`, `InitResourcesBar()`, `InitMainMenu()`
What it does:
Finishes UI/resource bindings and purchase/menu affordances.
Possible errors:
- Mostly resource and binding errors.
- Not the first place to look for an immediate direct-crash regression.

16. Event subscriptions
What it does:
- `ICredentialService.LoggedOut += OnLoggedOut`
- `ChatViewModel.OnMessagePosted += OnChatMessagePosted`
Possible errors:
- Resolution failures surface here if the container is incomplete.

17. Window/system UI handling
What it does:
Configures immersive mode and safe-area listeners.
Possible errors:
- OS-version-specific UI behavior issues are possible, but this block occurs after most critical startup work.

## First Backend Gate After Activity Startup

`OnCreate` itself does not perform the first API request. That starts after the navigation layer activates a view model that calls service methods built on `BaseService<T>.ExecuteApiAsync(...)` in GT.Core.

The backend call path is:

1. A view model calls a service method.
2. The service uses `BaseService<T>.ExecuteApiAsync(...)`.
3. `ExecuteApiAsync(...)` immediately calls `await URLHelper.CheckNetworkState()`.
4. `CheckNetworkState()` loops while `Connectivity.NetworkAccess != Internet`.
5. Each loop iteration shows `IPopupService.ShowErrorMessageAsync("NoInternetConnection"...)`.

This is a key startup/hang risk.

### Why the network gate can stall startup

`CheckNetworkState()` has no timeout, no backoff, and no alternate path. If Android connectivity never transitions to the expected state, the app can remain alive while never progressing to normal backend bootstrap.

That behavior fits the earlier stable-but-hanging symptom better than a loader crash does.

## First Loading Overlay Gate

The startup overlay is controlled by `ShellViewModel.IsLoadingScreenVisisble`, which defaults to `true`.

The first screens that clear it include:

- `LoginViewModel.Update()` sets it to `false`.
- `QuickStartViewModel.Update()` sets it to `false`.

Successful auth/register flows set it back to `true` before navigating to `ScreenIdentifier.Club`.

This means the app can appear stuck behind the loading state if either of these happens:

1. navigation never reaches a screen whose `Update()` hides the overlay,
2. a service call blocks before the login/quick-start screen finishes updating,
3. an exception occurs earlier in startup before the first visible screen state is established.

## Confirmed Startup Risks

### Risk 1: Third-party SDK initialization is unguarded and front-loaded

`InitializeHelpshift()`, `InitializeFacebookSDK()`, `AppCenter.Start(...)`, and `AppsFlyerLib.Instance.Init/Start(...)` all run during startup without local exception handling.

Impact:
- Any SDK failure aborts startup early.
- This is a credible source of pre-UI or near-pre-UI crashes.

### Risk 2: The previous tooling performed unsafe behavioral rewrites inside GT.Droid

`tools/AssemblyUrlPatcher/Program.cs` previously supported `--disable-helpshift`, `--disable-appcenter`, and `--disable-appsflyer` by replacing method or constructor bodies.

Impact:
- That changed real IL in GT.Droid.
- The rewritten payload could still be built and signed but fail the legacy Xamarin assembly-store/runtime expectations at startup.
- This is the most likely cause of the later direct-crash regression.

### Risk 3: Patched GT.Droid payload reinjection was too easy

`tools/patch_xamarin_assembly_store_urls.py` allowed a patched GT.Droid payload to be reinserted into `assemblies.blob` without any explicit unsafe opt-in.

Impact:
- A crash-prone experimental GT.Droid payload could be rebuilt into an APK as easily as the safe GT.Core URL-only patch path.

### Risk 4: Network readiness can block progress indefinitely

`URLHelper.CheckNetworkState()` loops forever until Android reports internet access.

Impact:
- The process can stay alive with no Goal Tactics backend traffic.
- The symptom is a hang or repeated popup flow, not a loader-level direct crash.

## Risk Separation

The startup investigation needs to keep these failure classes separate:

1. Loader/runtime packaging failure.
Cause profile:
Broken assembly-store rebuild or unsafe GT.Droid payload rewrite.
Symptom:
Direct crash very early, often before any meaningful backend activity.

2. App-level startup stall.
Cause profile:
Network gate, uncompleted navigation, loading overlay never cleared, or third-party startup side effects that do not hard-crash.
Symptom:
Process stays alive, app appears stuck, and backend traffic may be absent.

3. Backend/API incompatibility.
Cause profile:
Wrong URLs, contract mismatch, auth/bootstrap failures.
Symptom:
Later failure after the process and UI are already running.

## Practical Fixability

What can be safely fixed in this repository right now:

- block the unsafe GT.Droid rewrite flags in `tools/AssemblyUrlPatcher/Program.cs`,
- block accidental GT.Droid payload reinjection in `tools/patch_xamarin_assembly_store_urls.py` unless the caller explicitly opts into unsafe behavior,
- document the startup callflow and risk boundaries clearly.

What cannot be safely fixed here without original Xamarin source or a safer binary-preservation strategy:

- the internal GT.Droid startup code itself,
- the unguarded third-party SDK calls inside the managed payload,
- the `CheckNetworkState()` infinite loop behavior inside GT.Core,
- the exact app-level reason the stable descriptor-index-fixed build hangs.

## Conclusion

The code path confirms that startup is front-loaded with unguarded SDK and service initialization, then hands off to navigation and shell state that control the loading overlay and later backend calls. The direct-crash regression aligns with tooling-induced GT.Droid binary rewrites, while the stable splash/hang aligns with later app-level gating such as network readiness or startup flow not clearing `IsLoadingScreenVisisble`.
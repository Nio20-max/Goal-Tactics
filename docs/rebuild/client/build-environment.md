# Client Build Environment (Phase 3)

## Target backend endpoints
- API base: `https://gt.nikolai-linschmann.de/api/`
- Chat hub: `wss://gt.nikolai-linschmann.de/chat`
- Auction hub: `wss://gt.nikolai-linschmann.de/auc`

## Required toolchain
- Windows 11 or macOS with Xamarin legacy support installed.
- Visual Studio 2022 with:
- `Mobile development with .NET` workload
- Xamarin.Android components
- NuGet package restore support
- Android SDK Platform 34 (and build-tools 34.x)
- Java JDK 11 (or project-specific pinned JDK if the original app requires 8)

## Repository prerequisites
- Restored client source project (`.sln` + client `.csproj`) containing GT.Core and GT.Droid equivalent projects.
- `google-services.json` in Android app root.
- Billing product ids configured for test and release environments.
- Keystore for release signing and secure password injection.

## Environment variables
- `GT_BACKEND_URL=https://gt.nikolai-linschmann.de`
- `GT_CHAT_HUB=wss://gt.nikolai-linschmann.de/chat`
- `GT_AUC_HUB=wss://gt.nikolai-linschmann.de/auc`
- `ANDROID_SDK_ROOT=<path>`
- `JAVA_HOME=<path>`
- `GT_SIGNING_KEYSTORE=<path>`
- `GT_SIGNING_KEY_ALIAS=<alias>`
- `GT_SIGNING_STORE_PASSWORD=<secret>`
- `GT_SIGNING_KEY_PASSWORD=<secret>`

## Build steps
1. Restore NuGet packages for client solution.
2. Build Android Debug APK.
3. Build Android Release APK/AAB with signing.
4. Archive symbols and mapping files (if produced).

## This workspace status
- Server and bot projects are buildable in this repo.
- Original Xamarin client solution is not currently present as buildable source in this repo snapshot.
- Use scripts in `scripts/android-build-*.sh` once the client project path is restored.

# Important Files And Paths Summary

This folder is a reconstruction workspace organized so a build engineer can reassemble an APK pipeline using decompiled artifacts as reference.

## Folder Intent

- `android_project/`: Android app structure recovered from APK resources.
- `managed_dotnet/decompiled_csharp/`: Decompiled Xamarin/.NET game logic sources.
- `decompiled_java/jadx_sources/`: Decompiled Java wrappers and generated Android glue.
- `assets_and_resources/`: Runtime assets/native libs/signature metadata copied from APK contents.
- `build_metadata/`: Manifest-level and integration metadata needed to map app dependencies.
- `extra_useful_files/`: Binary artifacts that are useful as reverse-engineering references but are not decompiled source.
- `docs/`: Human-readable analysis and reconstruction notes.

## Most Important Files

- `android_project/AndroidManifest.xml`
  - Main Android app declaration.
  - Defines package name, permissions, exported components, deep links, services, and integration entry points.

- `android_project/res/`
  - XML resources for UI text, dimensions, styles, and configuration.
  - `values/strings.xml` is critical for feature flow reconstruction.

- `managed_dotnet/decompiled_csharp/GT.Core.decompiled.cs`
  - Primary game-domain logic (club systems, progression, models, and service contracts) from Xamarin managed layer.
  - Most gameplay behavior comes from this file.

- `managed_dotnet/decompiled_csharp/GT.Droid.decompiled.cs`
  - Android-specific app layer for Xamarin runtime integration and platform services.
  - Contains client/platform wiring.

- `decompiled_java/jadx_sources/`
  - Java shell code extracted by JADX.
  - Mostly wrappers around Xamarin runtime, but still useful for Android lifecycle mapping.

- `build_metadata/assemblies.manifest`
  - Index of managed assemblies in the original app package.
  - Required for mapping `GT.Core`, `GT.Droid`, and third-party .NET libraries.

- `build_metadata/*.properties`
  - Declares linked SDK modules (Firebase, Play Services, transport, etc.).
  - Useful for reconstructing exact mobile service footprint.

- `assets_and_resources/lib/`
  - Native architecture libs (`arm64-v8a`, etc.) used by Xamarin/Android runtime.

- `assets_and_resources/assets/`
  - App data files used at runtime.

## Extra Useful Files (Non-Decompiled)

- `extra_useful_files/Goal Tactics.apk`
  - Original binary APK for validation and diffing.

- `extra_useful_files/assemblies.blob`
  - Xamarin assembly store container from APK resources.

- `extra_useful_files/extracted_managed_binaries/`
  - Extracted managed DLL/PDB binaries used to create the decompiled C# outputs.

These binaries are intentionally separated so the main reconstruction remains decompiled-source-first.

## Practical Build-Reconstruction Path

1. Start from `android_project/AndroidManifest.xml` and `android_project/res/`.
2. Use `managed_dotnet/decompiled_csharp/*.cs` to recreate Xamarin project logic.
3. Use `build_metadata/assemblies.manifest` to reintroduce correct managed dependencies.
4. Use `build_metadata/*.properties` and manifest components to restore mobile SDK integrations.
5. Validate runtime requirements against `assets_and_resources/` and `extra_useful_files/Goal Tactics.apk`.

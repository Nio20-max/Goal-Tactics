# Goal Tactics Android App Rebuild Report

**Date:** 2026-03-10  
**Status:** In Progress — UI matching ongoing

---

## 1. Project Overview

Goal Tactics is a football (soccer) management game originally built as a Xamarin Android app by Xyrality (package: `com.xyrality.goaltactics`). The original APK is no longer maintained and its backend servers were shut down. The project goal is to rebuild the app as a native Android (Kotlin) client that is a **1:1 visual replica** of the original, connecting to a newly built ASP.NET backend.

---

## 2. What Has Been Done

### 2.1 Reverse Engineering & Asset Recovery

- **Decompiled the original APK** using apktool and other tools
- **Extracted 1,667 PNG assets** from the decompiled APK across multiple density buckets (xhdpi, xxhdpi, mdpi, hdpi)
- **Recovered 114 XML drawable resources** (backgrounds, selectors, gradients)
- **Captured 78 UI screens** from a running instance of the original app using `uiautomator dump` — each capture includes a screenshot, UI hierarchy XML dump, and metadata. Organized into 15 categories (login, club, league, transfer market, friends, ladder, scouting, training, stadium, shop/equipment, finances, settings, live match, chat/support, menu)
- **Decompiled the managed .NET assemblies** (GT.Core) to understand the original app's API endpoints, data models, and business logic

### 2.2 Backend Implementation

- Built a compatible ASP.NET Core backend (`GoalTactics.Api`) with:
  - ~80 API endpoints matching the original app's requests
  - SignalR hubs for real-time features (chat at `/chat`, auction at `/auc`)
  - Full test suite (25 tests passing via `dotnet test GoalTactics.slnx`)
- Backend is deployed and running at `https://gt.nikolai-linschmann.de/api/`

### 2.3 Android App Scaffold

Built a complete native Android app from scratch:

| Metric | Count |
|--------|-------|
| Kotlin source files | 29 |
| Lines of Kotlin code | 5,084 |
| Layout XML files | 29 |
| Total resource files | 1,826 |
| PNG assets imported | 1,667 |
| Fragment screens | 16 |
| API endpoints wired | ~80 |
| APK size (debug) | 117 MB |

**Tech stack:**
- Kotlin 1.9.22, Android Gradle Plugin 8.2.2
- compileSdk 34, minSdk 24, targetSdk 34
- Retrofit 2.9.0 + OkHttp 4.12.0 (networking)
- SignalR 7.0.14 (real-time)
- Coil 2.5.0 (image loading)
- Material 1.11.0 + ConstraintLayout 2.1.4 (UI)
- Landscape-locked orientation (matching original)

### 2.4 Screens Implemented

| Screen | Layout | Tabs | Status |
|--------|--------|------|--------|
| Login (3-page flow) | activity_login.xml | Create Team → Login → Register | ✅ Built |
| Main Shell + Nav | activity_main.xml | Side menu with 5 categories | ✅ Built |
| Club | fragment_club.xml | My Club / Sponsors / Inbox / Accomplishments | ✅ Built with tabs |
| Shop / Equipment | fragment_shop.xml | Products / Equipment | ✅ Built with tabs |
| Finances | fragment_finances.xml | Finance history / Yesterday / Today | ✅ Built with tabs |
| Stadium | fragment_stadium.xml | Info + Build places | ⚠️ Simplified (no scrollable map) |
| Squad | fragment_squad.xml | Player list + detail pane | ✅ Built |
| Lineup | fragment_lineup.xml | Formation field + player list | ✅ Built |
| Training | fragment_training.xml | Training + Training camp | ✅ Built with tabs |
| Scouting | fragment_scouting.xml | Instruct scout / Youth player | ✅ Built with tabs |
| Transfer Market | fragment_transfer.xml | Search result / Quick search / Bids & Favourites / My auctions | ✅ Built with tabs |
| League | fragment_league.xml | League / Matches / Fixture list / Goalscorers' list | ✅ Built with tabs |
| GT Ladder | fragment_ladder.xml | Ladder / Rewards | ✅ Built with tabs |
| Friends | fragment_friends.xml | Friends list / Challenges / Search friends | ✅ Built with tabs |
| Live Match | fragment_live.xml | Score + Game Course/Players/Statistics | ✅ Built |
| Settings | fragment_settings.xml | Settings / Notifications | ✅ Built with tabs |
| Chat | fragment_chat.xml | Messages + input | ✅ Built |
| Mail | fragment_mail.xml | Message list | ✅ Built |

### 2.5 Visual Matching Work Done

- **GT.TabLayout custom style** — matches the original game-themed tab bar with custom background (`navigationbar.png`), no indicator, filled tabs
- **42 country flag images** imported and wired for country selection
- **Login 3-page flow** replicating Create Team (with team name + country flag picker) → Login (with Facebook button placeholder, email/password) → Register (with manager name, email, password, confirm)
- **Menu order** matches original: Shop → Club management → Team Management → Matches → Other
- **Bottom resource bar** with Medipacks, GT Stars, Money display
- **Tab structures** on all screens matching original UI dump data

---

## 3. What Still Needs Work (Known Gaps)

### 3.1 Visual / Layout Issues

| Issue | Severity | Description |
|-------|----------|-------------|
| Stadium map | High | Original uses a scrollable 2D map (`StaduimView_ScrollView`) with building overlay ImageViews. Current version is a simplified info panel + RecyclerView. |
| Equipment tabs | Medium | Original Equipment has 4 dedicated tabs (My shirts / Buy a shirt / My emblems / Buy an emblem) with shirt/emblem preview images and Buy buttons. Current Shop merges this into a Products/Equipment split. |
| Player detail popups | Medium | Original has rich player detail views with tabs (Profile/Stats/Career). Current version uses AlertDialogs. |
| Exact color/font matching | Medium | While core colors and fonts are imported, some text sizes, shadows, and spacing may differ from the pixel-perfect original. |
| Live match rendering | Medium | Original has real-time animated match events. Current version shows a static event list. |
| Dialog styling | Low | Dialogs use default Material style, not the original game-themed dark dialogs. |
| Keyboard/input styling | Low | Input fields use basic styling, not the custom game-themed inputs. |

### 3.2 Functional Gaps

- Some API endpoints return data in slightly different formats than expected
- SignalR real-time features (live match updates, auction bidding) need integration testing
- Push notifications not implemented
- Facebook login not implemented (original had it, we show "not available")
- Sound/music settings UI exists but playback not implemented
- Several adapter item layouts are simplified compared to original row designs

---

## 4. Alternative Approaches

### 4.1 Current Approach: Native Kotlin Rewrite
**What we're doing:** Complete rewrite from scratch in native Kotlin using modern Android libraries.

| Pros | Cons |
|------|------|
| Clean, maintainable codebase | Significant manual effort to match every UI detail |
| Modern libraries and patterns | Each screen needs visual comparison and iteration |
| Full control over every pixel | Some original custom views (stadium map, animated match) are complex to replicate |
| Easy to extend and modify | 117 MB APK (large) due to all density PNG buckets |

### 4.2 Alternative: Patch the Original Xamarin APK
**Concept:** Take the original decompiled APK, patch the API URLs in the Xamarin assemblies to point to the new backend, and re-sign.

| Pros | Cons |
|------|------|
| **Perfect 1:1 UI** — it IS the original app | Xamarin assembly store patching is fragile (XALZ compression, descriptor_index, blob size constraints) |
| Minimal effort for visual matching | URL padding must use dot-segment padding (not slashes) due to .NET Uri normalization |
| All original animations, sounds, custom views work | Maintaining/updating the app long-term is very difficult |
| Much smaller scope of work | The Xamarin runtime is end-of-life — security patches stop |
| | Backend must maintain legacy GameEngine/* routes alongside new /api/* routes |

**Status:** This approach was investigated extensively in Phase 3 (compatibility patches). Several attempts were made with `apktool b --use-aapt2` and assembly store patching via `tools/patch_xamarin_assembly_store_urls.py`. Key learnings documented:
- URL literals must be padded with `../` and `./` (not `/`) to preserve path normalization
- The assemblies.blob must preserve original compressed payload sizes
- Descriptor indices must be preserved during XALZ recompression
- The app requires both legacy BaseServiceUrl (`/GameEngine/*`) and newer NewBackendUrl (`/api/*`, `/chat`, `/auc`) routes

### 4.3 Alternative: Hybrid Approach (Recommended)
**Concept:** Use the patched Xamarin APK as the "production" 1:1 replica NOW, while continuing to develop the native Kotlin app as the long-term replacement.

| Phase | Action |
|-------|--------|
| **Phase A (Immediate)** | Complete the Xamarin APK patching to get a perfect 1:1 replica working with the new backend |
| **Phase B (Parallel)** | Continue iterating the Kotlin app UI, screen by screen, using the running Xamarin app as the definitive visual reference |
| **Phase C (Transition)** | Once the Kotlin app achieves visual parity, sunset the Xamarin version |

This gives you:
1. A working, pixel-perfect app immediately via the patched Xamarin APK
2. A maintainable, modern codebase for the long term via the Kotlin rewrite
3. A live visual reference (the Xamarin app) to compare against while developing

### 4.4 Alternative: WebView/Hybrid App
**Concept:** Build the UI as a responsive web app (HTML/CSS/JS), wrap it in a WebView-based Android app.

| Pros | Cons |
|------|------|
| Single codebase for web + mobile | Performance may be worse than native |
| Easier to match visual details with CSS | Complex interactions (drag-drop lineup) harder in web |
| Hot-reloadable during development | Native features (push, local storage) need bridges |
| | WebView rendering may differ across Android versions |

### 4.5 Alternative: Flutter/React Native Cross-Platform
**Concept:** Rewrite using a cross-platform framework.

| Pros | Cons |
|------|------|
| iOS support in the future | Additional learning curve |
| Hot reload for faster UI iteration | Native Android look-and-feel harder to match |
| Large component libraries | Cross-platform abstractions may limit customization |
| | Adds framework dependency |

---

## 5. Recommendation

The **Hybrid Approach (4.3)** is the most pragmatic path:

1. **Short-term:** Finalize the Xamarin APK patch to deliver a working 1:1 replica quickly. The tooling (`patch_xamarin_assembly_store_urls.py`) already exists, and the key pitfalls are documented.

2. **Long-term:** Continue the Kotlin native rewrite, using the patched Xamarin app as the pixel-perfect visual reference. This ensures the UI matches exactly, since you can run both apps side-by-side and compare screen by screen.

3. **The Kotlin rewrite's main remaining work** is visual polish — the functional framework (API, navigation, tab structures, data loading) is already complete. The gap is in fine-tuning individual screen layouts, item row designs, dialog styling, and custom views (stadium map, match animations).

---

## 6. File Inventory

**Source code:** `android-app/app/src/main/java/com/goaltactics/app/`
- `data/api/` — GoalTacticsApi.kt (API interface), ApiClient.kt (Retrofit setup)
- `data/model/` — Models.kt (~790 lines of data classes)
- `ui/adapters/` — Adapters.kt (11 RecyclerView adapters)
- `ui/fragments/` — 16 fragment files (2,654 lines total)
- `ui/shell/` — MainActivity.kt (app shell + navigation)
- `ui/viewmodels/` — LoginViewModel.kt
- `GoalTacticsApp.kt` — Application class

**Layouts:** `android-app/app/src/main/res/layout/` — 29 XML files  
**Resources:** `android-app/app/src/main/res/` — 1,826 files across drawable, values, menu, mipmap  
**UI References:** `analysis/ui_captures/` — 78 screen captures, 15 categories  
**Tools:** `tools/patch_xamarin_assembly_store_urls.py`, `tools/capture_ui.py`

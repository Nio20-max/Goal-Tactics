# UI Extraction Playbook

## Purpose

This document explains how to get the UI definition out of the legacy Xamarin-era app artifacts well enough to rebuild the client without Xamarin.

The key point is this:

You cannot meaningfully "send requests to the files" and have them hand back the UI. These files are not a live UI service. Instead, UI recovery has to combine:

- static resource extraction,
- managed code analysis,
- runtime observation of the preserved APK,
- screenshot and layout-tree capture,
- fixture-driven state unlocking.

## Important Discovery

This legacy app is not mainly a Xamarin.Forms/XAML app.

The strongest UI sources are:

- decoded Android resources under APK `res/`
- `GT.Droid` managed code that inflates layouts and wires controls
- string/style/drawable resources
- custom Android view classes implemented in managed code

That changes the extraction strategy completely.

## Source Layers To Extract From

### Layer 1. Android XML resources

Use:

- `analysis/phase3_compat/apk_dec/res/layout*`
- `analysis/phase3_compat/apk_dec/res/values*`
- `analysis/phase3_compat/apk_dec/res/drawable*`
- `analysis/phase3_compat/apk_dec/res/menu*` if present
- `analysis/phase3_compat/apk_dec/res/xml*`

What to extract:

- layout trees
- view ids
- dimensions
- colors
- strings
- styles/themes
- drawable references
- state-list and selector behavior

Output to create during execution:

- layout catalog
- style token table
- string key catalog
- drawable inventory

### Layer 2. Managed GT.Droid view wiring

Use:

- `reverse_engineering/decompiled/GT.Droid.actual/GT.Droid.decompiled.cs`

What to extract:

- `SetContentView(...)` roots
- every `LayoutInflater.Inflate(...)` call
- every `FindViewById(...)` binding
- every custom view class and its `Initialize()` method
- `ItemTemplate`, header template, popup template, and list cell wiring
- screen registration from `Register(ScreenIdentifier, Type)`
- bindings between view ids and view-model properties

Why this matters:

XML alone does not tell you:

- which screen a layout belongs to
- which view ids are important
- what user action each button triggers
- which controls are shown/hidden based on state

The managed code fills those gaps.

### Layer 3. Managed GT.Core state and behavior

Use:

- `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`
- recovered rebuild docs under `docs/rebuild/`

What to extract:

- navigation flow
- view-model properties that drive visibility and text
- popup and confirmation rules
- timers, lock states, badges, and progress logic
- domain-dependent UI states such as injured player, lineup lock, sponsor timers, training expiry

Why this matters:

To match the old UI, you need to match not just static layout but also state transitions and visibility rules.

## Static Extraction Workflow

### Step 1. Build a resource id map

Create a mapping from numeric resource ids to symbolic names using:

- `public.xml`
- decoded resources

This is mandatory because GT.Droid often references only numeric ids in decompiled output.

### Step 2. Build a screen-to-layout map

Trace:

- `MainActivity.InitNavigation()` registrations
- each view class constructor
- each `Inflate(...)` call

Produce a table like:

- screen identifier
- view type
- root layout id
- child item templates
- popup layouts used from that screen

### Step 3. Build a view binding map

For every screen and custom view, record:

- resource id
- widget type
- binding property
- event handler
- visibility rules
- formatting rules

### Step 4. Build a component taxonomy

Identify reusable widgets such as:

- money and stars bar
- progress widgets
- skill stars
- list/table controls
- popup shells
- tab headers
- notification widgets

Rebuild these once as shared components instead of rebuilding them screen by screen.

## Runtime Extraction Workflow

Static extraction is not enough. The preserved APK should also be used as a live reference implementation.

### Step 5. Run the preserved APK in a controlled environment

Use the safest known baseline APK and run it against either:

- the compatibility backend,
- or a mock backend that returns controlled fixture states.

Purpose:

- confirm layout appearance
- capture UI states unreachable through static analysis alone
- observe transitions, delays, and overlays

### Step 6. Capture screenshots and layout trees

Use runtime tools such as:

- Android Studio Layout Inspector
- `adb exec-out screencap`
- UIAutomator or Appium-driven flows
- accessibility hierarchy dumps

Expected output:

- full-screen screenshots for each screen and popup
- state-variant screenshots
- runtime view tree snapshots
- screen recordings for transition timing where important

### Step 7. Build state fixtures to unlock every UI state

Many important states will not be easy to trigger manually.

Create response fixtures for:

- empty lists
- unread mail
- active stadium build
- locked lineup
- injured players
- expired contracts
- training in progress
- scout cooldowns
- sponsor offers
- transfer bids and favorites
- live match states

Purpose:

- drive both the old APK and the new rebuild into the same known states
- make parity comparison repeatable

## Extraction Outputs Required Before Rebuild Coding Starts

These artifacts should exist before serious UI implementation begins:

1. Screen inventory
2. Layout inventory
3. Resource id map
4. Shared component inventory
5. Navigation graph
6. Screenshot baseline set
7. State fixture library
8. View binding matrix
9. Parity notes for each screen

## Practical Extraction Limits

Some things will not fall out automatically from the old files:

- exact animation curves in every case
- subtle timing of async loading states
- edge-case behavior hidden behind server conditions
- SDK-driven screens that depend on obsolete third-party services

Those need manual reconstruction after observation.

## Recommended Tooling Work To Schedule

The rebuild plan should include scripts or tools for:

- resource id decoding
- `Inflate(...)` and `FindViewById(...)` extraction from decompiled C#
- screen-to-layout graph generation
- screenshot naming and comparison pipeline
- fixture replay server or API mock layer

## Rule For Fidelity Decisions

If the old APK and static analysis disagree, prefer the live APK output unless it is clearly corrupted by the current compatibility limitations.
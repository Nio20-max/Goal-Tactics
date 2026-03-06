# Goal Tactics App Reconstruction

## Scope and confidence

This folder documents how the decompiled Goal Tactics Android client appears to have worked in version 1.2.4 (versionCode 66). The account is based on four evidence sources inside this workspace:

- the feature notes in reference_materials/Goal Tactics.md under current version
- the Android manifest and resource strings in reverse_engineering/output_dir/resources
- the Xamarin assembly manifest in reverse_engineering/output_dir/resources/assemblies/assemblies.manifest
- metadata strings embedded in the Xamarin managed assembly store in reverse_engineering/output_dir/resources/assemblies/assemblies.blob

One important limitation mattered during the first pass: this APK is a Xamarin app. The Java sources under reverse_engineering/output_dir/sources are mostly Android wrapper classes, while the real game logic lives in GT.Core and GT.Droid inside the Xamarin assembly blob. A later extraction pass recovered both managed assemblies, and the exact backend and Android findings from that pass are documented in managed-assembly-findings.md. Because parts of this folder were written before that recovery step, this write-up still separates three levels of confidence:

- Confirmed: directly visible in manifest, resources, or feature notes.
- Strongly supported: visible through managed metadata names and platform integrations.
- Inferred: the most likely implementation model for a live multiplayer football manager with these services and screens.

Despite that limitation, the overall product shape is clear enough to reconstruct how the app worked end to end.

## What the app was

Goal Tactics was a live, online football management game. The player acted as the manager of a club, not as a direct controller in real-time football matches. The loop was managerial and persistent:

1. Create or log into a club.
2. Build a squad through scouting, training, upgrades, and the transfer market.
3. Set lineups, tactics, player roles, and training plans.
4. Earn money and premium currency through sponsors, logins, ads, and purchases.
5. Compete in league matches, friendlies, and GT Ladder matches.
6. Follow results through match reports and a live ticker.
7. Repeat across seasons while growing the club, stadium, and squad quality.

This was not a standalone offline sports game. The whole design points to a server-backed club simulation with shared leagues, auctions, social systems, chat, and season progression.

## High-level game loop

### 1. Account and club setup

The onboarding flow asked for a manager name, password, and team name. Resource strings such as QuickStartTitle, RegisterTitle, YourManagerName, YourTeamName, SignInSignUp, and SignInText show that the game supported both new registration and existing sign-in. Facebook account connection existed both for account linking and friend invitations.

The likely startup path was:

- launch MainActivity
- authenticate with the game backend using manager credentials or a linked identity
- fetch club state from the backend
- enter the main club-management shell

### 2. Daily management phase

Once inside the app, the player managed several interlocking systems:

- Club overview and accomplishments
- Finances and sponsor income
- Stadium upgrades and other club buildings
- Squad review, training, upgrades, healing, and contracts
- Lineup planning for upcoming matches
- Scouting and transfer-market activity
- Social actions such as friendlies, inbox, chat, and invites

The app rewarded daily return behavior. A string named DailyLoginMessage shows a daily sponsor reward in stars. Local notifications also pushed users back for expired sponsors, completed buildings, ending auctions, expiring contracts, finished training, and season changes.

### 3. Match and competition phase

The app then moved clubs into scheduled competition:

- domestic league matchdays
- friendly matches with other managers
- GT Ladder matches against the wider player base

The player did not manually control the footballers on the pitch. Instead, team strength was produced by roster quality, training, tactics, formation, player roles, fitness, and club improvements. The result was then presented through tables, match results, match history, game course, and a live ticker.

### 4. Seasonal persistence

The club continued across seasons. Strings such as SeasonInfo, LocalNotificationSeasonEndBody, and LocalNotificationSeasonStartTitle show a structured season calendar. That means the backend likely ran a long-lived world with synchronized season timing rather than isolated save files on device.

## What made the game compelling

The core appeal appears to have come from combining several systems into one progression loop:

- Long-term squad building and player development
- Tactical and lineup optimization before scheduled matches
- Shared social competition through leagues, ladders, auctions, and chat
- Constant small objectives: training renewals, sponsor contracts, scouting windows, transfer bids, and club upgrades
- Monetized acceleration through stars, videos, and purchases

This gave the game the shape of an online football manager with idle timers, live economy, and asynchronous multiplayer competition.

## The product architecture in one sentence

Goal Tactics was a Xamarin-based cross-platform football manager client whose Android shell handled launch, ads, billing, notifications, and platform SDKs, while shared GT.Core logic likely talked to a central game backend over HTTP APIs plus SignalR for selected real-time features.

## Cross-platform architecture

The assembly manifest is the clearest architectural clue. It includes GT.Droid and GT.Core as app-owned assemblies, alongside Refit, Microsoft.AspNetCore.SignalR.Client, Newtonsoft.Json, Plugin.InAppBilling, Xamarin.Firebase.Messaging, Xamarin.Facebook.Login.Android, HelpshiftApi, AppsFlyerXamarinBindingAndroid, Microsoft.AppCenter, and IronSource.

That combination strongly suggests:

- GT.Core contained shared business logic and network clients.
- GT.Droid contained Android-specific UI integration and SDK bridges.
- the same shared core likely existed on iOS as well; paths embedded in the blob reference GTClientIOS.

This is consistent with a Xamarin product where most gameplay and networking code lives in shared C# assemblies and only platform integrations differ between Android and iOS.

## Confirmed integrations

From the manifest, resources, and assembly manifest, the app definitely integrated:

- Firebase Cloud Messaging for push notifications
- Firebase Analytics and Firebase Installations
- Facebook login and invite/share flows
- Google Play Billing for in-app purchases
- IronSource rewarded video ads
- Helpshift for customer support and support conversations
- AppsFlyer for attribution and marketing measurement
- Microsoft App Center for analytics and crash reporting
- ASP.NET Core SignalR client libraries
- Refit for typed HTTP API calls

## What that means in practice

The app was not a thin WebView wrapper. It was a real native-shell mobile client with a shared C# application layer. It kept local UI state, displayed push and local notifications, integrated native billing and ad SDKs, and likely consumed a proprietary multiplayer backend for all important club and match data.

## Files in this folder

- features-and-frontend.md: what the user could do and how the client likely presented it
- backend-and-live-services.md: how the online systems most likely worked
- faq.md: likely reader questions answered directly

## Bottom-line reconstruction

If someone had never seen Goal Tactics before, the simplest accurate description is this:

Goal Tactics was an always-online club-management game where you ran a football team over many seasons. You built a club, trained players, healed injuries, upgraded facilities, scouted youth, traded on a live transfer market, configured lineups and tactics, played league and ladder competitions, invited other managers to friendlies, chatted with the wider community, and monetized faster progress through stars, rewarded ads, and in-app purchases. The client was built in Xamarin, used a shared GT.Core logic layer, and depended on a server-authoritative backend for competition, persistence, economy, matchmaking, and timed progression.
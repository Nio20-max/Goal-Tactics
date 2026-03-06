# Goal Tactics FAQ and completeness check

## Completeness check

This reconstruction covers the app from four angles:

- product purpose and game loop
- user-facing features and frontend behavior
- backend architecture and live-service behavior
- likely reader questions and edge cases

What is complete:

- the app's feature set at a functional level
- how the player moved through the game
- which systems were local UI versus server-backed world state
- which third-party services were integrated and why
- how monetization, notifications, support, and social systems fit together

What is not fully recoverable from the available APK contents:

- exact backend endpoint names
- the full C# implementation of GT.Core method bodies
- the exact real-time hub topology

Those gaps come from the Xamarin managed assemblies being stored in XALZ assembly-store format rather than exposed as plain DLLs in this workspace.

## Questions someone will probably ask

### Was Goal Tactics online-only?

Effectively yes.

The manifest requires internet access, the app integrates Firebase Messaging, SignalR client libraries, billing, social identity, and several shared-world systems. League play, GT Ladder, chat, transfer auctions, inbox events, and season progression all imply a connected backend.

### Did the app simulate matches locally on the phone?

Probably not as the source of truth.

The client almost certainly displayed results and live updates, but the authoritative match calculation was most likely server-side. That is the only robust way to keep league tables, ladder standings, goalscorer lists, and player-vs-player friendlies consistent across all clubs.

### What was the difference between money and stars?

Money was the regular in-game club currency. Stars were the premium currency.

Money appears to have been used for normal club operations such as some scouting and stadium upkeep. Stars were used for faster progress, premium scouting, player upgrades, timers, cosmetics, Medi-Packs, and direct purchases.

### How did the shop work?

The shop combined several monetization channels:

- direct star purchases through Google Play Billing
- rewarded ads through IronSource
- item purchases such as Medi-Packs, shirts, and emblems
- reward flows for connecting Facebook or setting email

Goal Tactics.md also confirms star bundle prices and the rewarded-ad star payout logic for the current version.

### What exactly was GT Ladder?

GT Ladder appears to have been a separate online competition mode that ran in parallel to the normal league. It used a Team-Stamina resource that could be refilled with stars. That makes it look like a repeatable global or cross-league competitive mode intended to increase engagement beyond the standard domestic schedule.

### How important were tactics and lineups?

Very important.

The app invested heavily in lineup completeness, formation, tactic selection, role assignment, and training of tactics. It also froze lineup changes before kickoff. That only makes sense if pre-match preparation directly influenced the backend's match outcome calculations.

### How were injuries handled?

Players could be injured for a time period, and Medi-Packs instantly restored them. The strings explicitly describe converting a number of Medi-Packs into immediate match fitness. Goal Tactics.md also confirms that Medi-Packs were sold in the shop.

### Was the transfer market against real players or bots?

Mostly real-player market behavior is the most likely answer.

The language around auctions, overbids, favourites, selling your own players, and closing times all fits a shared auction market. Some AI clubs also existed, because the strings mention AI teams whose player information was not available.

### Did the app have social features beyond friendlies?

Yes.

It had:

- a friend system
- challenge and friendly requests
- in-game inbox messages
- at least one broad chat channel
- Facebook-based linking and invitation flows
- cross-app sharing via Messenger, WhatsApp, and generic share targets

### How did notifications work?

There were two layers:

- Firebase push for server-driven events
- local Android alarms for predictable timer reminders

Notifications were used to pull the player back for finished training, expiring contracts, sponsor renewals, completed buildings, auctions, and season events.

### Was the frontend native Android?

Not in the usual Java or Kotlin sense.

The Android package is a Xamarin application. Android provides the activity, notification receiver, Firebase service, and SDK integrations, but the real app logic lives in shared .NET assemblies named GT.Core and GT.Droid.

### Was there only one backend?

There were multiple service layers, but one central game backend.

The core game backend likely handled club state, matches, economy, and social systems. Around that core sat operational services such as Firebase, Helpshift, AppsFlyer, App Center, Facebook, Google Play Billing, and IronSource.

### Could the game continue while the app was closed?

Yes, almost certainly.

That is one of the clearest design traits. Buildings, scouting, contracts, training, auctions, sponsors, and season timing all appear to advance on server or wall-clock time even when the app is not open.

### What did the player actually do during a normal session?

The most likely session flow was:

1. Open the app and collect current club state.
2. Claim or review daily rewards and reports.
3. Check lineup status, upcoming matches, and training expirations.
4. Adjust squad, tactics, and individual actions.
5. Spend resources on scouting, transfer bids, upgrades, or shop items.
6. Review league, ladder, inbox, and chat.
7. Leave and return later when timers or matches complete.

### Was this app more about football management or direct football play?

It was overwhelmingly a management game.

Every major feature revolves around planning, progression, and shared asynchronous competition. The live component appears to be viewing and reacting to results, not controlling the footballers in real time.

## Final answer in one paragraph

Goal Tactics worked as a persistent online football-manager game built in Xamarin, where the phone client acted as the control panel for a server-run club simulation. Players created a club, built facilities, managed finances, scouted and traded for players, trained the squad, set formations and tactics, healed injuries, competed in leagues and the GT Ladder, played friendlies, chatted with the community, and progressed across seasons. The client used HTTP APIs plus likely SignalR live channels, and it integrated Firebase, billing, rewarded ads, Facebook, Helpshift, AppsFlyer, and App Center to support messaging, monetization, support, and analytics.
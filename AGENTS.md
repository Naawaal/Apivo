# AGENTS.md — Apivo

Guidance for AI agents working in this repository.

## Project summary

**Apivo** is a cross-platform Flutter API client for building, sending, and inspecting HTTP requests. It targets desktop and mobile with an adaptive shell (navigation rail on wide screens, bottom nav on compact layouts).

## Tech stack

| Layer | Choice |
|-------|--------|
| Framework | Flutter (Dart SDK ^3.12) |
| State | Riverpod (`NotifierProvider`, `ConsumerWidget`) |
| Routing | go_router (`StatefulShellRoute`, named routes) |
| HTTP | Dio |
| Local DB | Drift + sqlite3 |
| Fonts | google_fonts (Inter via design tokens) |
| Linting | flutter_lints |

## Repository layout

```
lib/
├── app.dart                 # MaterialApp.router root
├── main.dart                # Entry point, ProviderScope, logging init
├── core/
│   ├── constants/           # AppStrings, AppSizes, AppConstants
│   ├── design/              # Theme, tokens (colors, spacing, typography)
│   ├── logging/             # AppLogger
│   ├── network/             # Dio client, timers, exceptions
│   ├── router/              # GoRouter config, route paths/names
│   └── utils/               # Validators, formatters, extensions
├── database/
│   └── tables/              # Drift table definitions
├── features/
│   └── <feature>/
│       ├── domain/          # Models, enums, value types
│       ├── data/            # Repositories, mappers, runners
│       └── presentation/    # Screens, controllers, widgets
└── shared/
    ├── layout/              # AppShell, AdaptivePage, PageContainer
    └── widgets/             # Reusable UI (AppButton, AppCard, …)
```

## Architecture rules

1. **Feature-first** — Keep domain, data, and presentation inside `lib/features/<feature>/`. Do not import across features except through clear public APIs.
2. **Shared only for cross-cutting UI** — Use `lib/shared/` for design-system widgets and layout primitives used by multiple features.
3. **Core for infrastructure** — Network, routing, theme, logging, and generic utils live in `lib/core/`.
4. **Controllers own feature state** — Use `Notifier` + `NotifierProvider` with immutable state classes and `copyWith`. Screens watch providers; widgets stay dumb when possible.
5. **Domain models are pure** — No Flutter imports in `domain/`. Enums and data classes only.
6. **Data layer talks to the outside world** — HTTP via `RequestRunner` / Dio, persistence via Drift tables.

## UI conventions

- Use **design tokens** from `core/design/tokens/` (`AppColors`, `AppSpacing`, `AppTypography`, `AppRadius`) — never hardcode colors or spacing in widgets.
- Use **shared widgets** (`AppButton`, `AppTextField`, `AppCard`, `AppSectionHeader`, etc.) before creating one-off components.
- Put user-visible strings in **`AppStrings`** (`core/constants/app_strings.dart`).
- Support **responsive layouts** via `BuildContext` extensions (`isCompact`, `isExpanded`) and `AdaptivePage`.
- **Light and dark themes** are required; use `Theme.of(context)` and `context.colorScheme`, not raw `AppColors` in widgets unless for semantic badges.
- Use **Material Icons** consistently (outlined/rounded pairs in navigation).

## Routing

- Paths and names live in `core/router/route_paths.dart` and `route_names.dart`.
- Main tabs use `StatefulShellRoute.indexedStack` inside `AppShell`.
- Full-screen flows (e.g. request builder) register on the root navigator with `parentNavigatorKey`.

## Networking

- HTTP execution goes through `features/request_builder/data/request_runner.dart` and `core/network/dio_client.dart`.
- Map domain models to Dio options in `request_mapper.dart`.
- Surface errors via `NetworkException` / `NetworkResult`; log with `AppLogger`.

## Database (Drift)

- Table definitions: `lib/database/tables/`.
- Run code generation after schema changes: `dart run build_runner build --delete-conflicting-outputs`.

## Commands

```bash
# Install dependencies
flutter pub get

# Run (pick a device)
flutter run

# Analyze
flutter analyze

# Regenerate Drift
dart run build_runner build --delete-conflicting-outputs
```

## What to avoid

- Cross-feature imports (e.g. home importing request_builder internals).
- Business logic in `build()` methods — use controllers/providers.
- Magic strings in UI — add to `AppStrings`.
- New dependencies without a clear need; prefer existing stack.
- Large monolithic files — split by screen, controller, or widget role.
- Committing generated Drift files unless the project already does (check `.gitignore`).

## Adding a new feature

1. Create `lib/features/<name>/` with `domain/`, `data/` (if needed), `presentation/`.
2. Add route in `app_router.dart` and constants in `route_paths.dart` / `route_names.dart`.
3. Add navigation entry in `AppShell` or parent screen if user-facing.
4. Add strings to `AppStrings`.
5. Reuse shared widgets and tokens.

## Current features

| Feature | Status |
|---------|--------|
| `request_builder` | Active — send HTTP requests, auth, body, response panel |
| `home` | Active — dashboard, quick actions, recent requests |
| `collections` | Scaffolded |
| `history` | Scaffolded |
| `environments` | Scaffolded |
| `settings` | Scaffolded |

When extending scaffolded features, follow the same patterns as `request_builder` and `home`.

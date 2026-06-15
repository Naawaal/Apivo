# Apivo

A modern, cross-platform API client built with Flutter. Compose HTTP requests, inspect responses, and organize work across collections, history, and environments — with a responsive UI that adapts from phone to desktop.

## Features

- **Request builder** — Methods, URL, query params, headers, body (JSON, form, raw), and auth (Bearer, Basic, API key)
- **Response inspector** — Status, timing, size, and tabbed body/headers view
- **Adaptive shell** — Bottom navigation on compact screens; navigation rail on wider layouts
- **Theming** — Light and dark mode with a consistent design system
- **Local persistence** — Drift/SQLite for collections, saved requests, and history (in progress)

## Tech stack

| Package | Purpose |
|---------|---------|
| [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) | State management |
| [go_router](https://pub.dev/packages/go_router) | Declarative routing |
| [dio](https://pub.dev/packages/dio) | HTTP client |
| [drift](https://pub.dev/packages/drift) | SQLite ORM |
| [google_fonts](https://pub.dev/packages/google_fonts) | Typography |

## Project structure

```
lib/
├── core/           # Theme, router, network, logging, constants
├── database/       # Drift table definitions
├── features/       # Feature modules (home, request_builder, …)
└── shared/         # Reusable widgets and layout
```

Each feature follows **domain → data → presentation** layering. See [AGENTS.md](AGENTS.md) for architecture details and agent guidelines.

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart ^3.12)
- A device or emulator (Windows, macOS, Linux, iOS, Android, or web)

### Setup

```bash
git clone <repository-url>
cd apivo
flutter pub get
```

### Run

```bash
flutter run
```

Pick a target platform when prompted, or specify one:

```bash
flutter run -d windows
flutter run -d chrome
```

### Analyze

```bash
flutter analyze
```

### Code generation (Drift)

After changing database schemas under `lib/database/`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Development

### Adding a feature

1. Create `lib/features/<name>/` with `domain/`, `data/`, and `presentation/` as needed.
2. Register routes in `lib/core/router/`.
3. Add user-facing strings to `lib/core/constants/app_strings.dart`.
4. Reuse components from `lib/shared/widgets/`.

### Cursor / AI agents

- **[AGENTS.md](AGENTS.md)** — Architecture, conventions, and commands for AI assistants.
- **`.cursor/rules/`** — Cursor rules for project context, architecture, UI, and Dart standards.

## Roadmap

- [ ] Collections CRUD and request saving
- [ ] Request history with replay
- [ ] Environment variables and base URLs
- [ ] Import/export (OpenAPI, Postman)
- [ ] Unit and widget tests

## License

Private project — not published to pub.dev (`publish_to: 'none'`).

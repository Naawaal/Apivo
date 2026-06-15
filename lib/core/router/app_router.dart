import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/collections/presentation/collections_screen.dart';
import '../../features/environments/presentation/environments_screen.dart';
import '../../features/history/presentation/history_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/request_builder/presentation/request_builder_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../shared/layout/app_shell.dart';
import 'route_names.dart';
import 'route_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorCollectionsKey =
    GlobalKey<NavigatorState>(debugLabel: 'collections');
final _shellNavigatorHistoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'history');
final _shellNavigatorEnvironmentsKey =
    GlobalKey<NavigatorState>(debugLabel: 'environments');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: RoutePaths.home,
                name: RouteNames.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCollectionsKey,
            routes: [
              GoRoute(
                path: RoutePaths.collections,
                name: RouteNames.collections,
                builder: (context, state) => const CollectionsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHistoryKey,
            routes: [
              GoRoute(
                path: RoutePaths.history,
                name: RouteNames.history,
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEnvironmentsKey,
            routes: [
              GoRoute(
                path: RoutePaths.environments,
                name: RouteNames.environments,
                builder: (context, state) => const EnvironmentsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                name: RouteNames.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.request,
        name: RouteNames.request,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const RequestBuilderScreen(),
      ),
    ],
  );
});

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/router/route_paths.dart';
import '../../core/utils/extensions.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    (icon: Icons.home_outlined, selectedIcon: Icons.home_rounded, label: AppStrings.navHome, path: RoutePaths.home),
    (icon: Icons.folder_outlined, selectedIcon: Icons.folder_rounded, label: AppStrings.navCollections, path: RoutePaths.collections),
    (icon: Icons.history_outlined, selectedIcon: Icons.history_rounded, label: AppStrings.navHistory, path: RoutePaths.history),
    (icon: Icons.layers_outlined, selectedIcon: Icons.layers_rounded, label: AppStrings.navEnvironments, path: RoutePaths.environments),
    (icon: Icons.settings_outlined, selectedIcon: Icons.settings_rounded, label: AppStrings.navSettings, path: RoutePaths.settings),
  ];

  @override
  Widget build(BuildContext context) {
    if (context.isExpanded) {
      return _buildRailLayout(context);
    }
    return _buildBottomNavLayout(context);
  }

  Widget _buildRailLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: context.screenWidth >= 1200,
            minWidth: AppSizes.navRailWidth,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onDestinationSelected,
            labelType: context.screenWidth >= 1200
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            destinations: _destinations
                .map(
                  (d) => NavigationRailDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selectedIcon),
                    label: Text(d.label),
                  ),
                )
                .toList(),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }

  Widget _buildBottomNavLayout(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: _destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                selectedIcon: Icon(d.selectedIcon),
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

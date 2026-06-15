import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      showAppBar: false,
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.settingsTitle,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            Text(
              AppStrings.settingsAppearance,
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.palette_outlined),
                    title: const Text(AppStrings.settingsTheme),
                    subtitle: const Text(AppStrings.settingsThemeSystem),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language_rounded),
                    title: const Text('Language'),
                    subtitle: const Text('English'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            Text(
              AppStrings.settingsAbout,
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_outline_rounded),
                    title: const Text(AppConstants.appName),
                    subtitle: Text(
                      '${AppStrings.settingsVersion} ${AppConstants.appVersion}',
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.code_rounded),
                    title: const Text('Open Source Licenses'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

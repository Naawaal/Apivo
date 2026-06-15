import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../environments/presentation/environments_providers.dart';
import '../../../../shared/widgets/app_chip.dart';

class VariablesHelper extends ConsumerWidget {
  const VariablesHelper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final variablesAsync = ref.watch(activeEnvironmentVariablesProvider);

    return variablesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (variables) {
        if (variables.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.availableVariables,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: variables
                  .where((variable) => variable.isEnabled)
                  .map(
                    (variable) => AppChip(
                      label: variable.token,
                      selected: false,
                      onSelected: (_) {
                        Clipboard.setData(
                          ClipboardData(text: variable.token),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppStrings.variableCopied),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_chip.dart';
import '../../../environments/presentation/environments_providers.dart';
import '../controllers/request_builder_controller.dart';

class ActiveEnvironmentSelector extends ConsumerWidget {
  const ActiveEnvironmentSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final environmentsAsync = ref.watch(environmentsProvider);
    final active = ref.watch(activeEnvironmentProvider).valueOrNull;
    final notifier = ref.read(requestBuilderControllerProvider.notifier);

    return environmentsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (environments) {
        if (environments.isEmpty) {
          return Align(
            alignment: Alignment.centerLeft,
            child: AppChip(
              label: AppStrings.noEnvironment,
              selected: false,
            ),
          );
        }

        return Row(
          children: [
            Icon(
              Icons.layers_outlined,
              size: 18,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String?>(
                  isExpanded: true,
                  value: active?.id,
                  hint: Text(
                    AppStrings.noEnvironment,
                    style: theme.textTheme.bodySmall,
                  ),
                  items: [
                    ...environments.map(
                      (environment) => DropdownMenuItem<String?>(
                        value: environment.id,
                        child: Text(
                          environment.isActive
                              ? '${environment.name} (${AppStrings.activeEnvironment})'
                              : environment.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      notifier.setActiveEnvironment(value);
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

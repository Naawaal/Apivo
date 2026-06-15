import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_empty_state.dart';
import '../../../shared/widgets/app_error_state.dart';
import '../../../shared/widgets/app_loading.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../data/environments_repository.dart';
import 'environments_providers.dart';
import 'widgets/add_variable_dialog.dart';
import 'widgets/edit_environment_dialog.dart';
import 'widgets/environment_variable_row.dart';

class EnvironmentDetailScreen extends ConsumerWidget {
  const EnvironmentDetailScreen({super.key, required this.environmentId});

  final String environmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environmentAsync = ref.watch(
      FutureProvider((ref) async {
        return ref
            .read(environmentsRepositoryProvider)
            .getEnvironmentById(environmentId);
      }),
    );
    final variablesAsync =
        ref.watch(environmentVariablesProvider(environmentId));

    return AppScaffold(
      showAppBar: true,
      title: environmentAsync.maybeWhen(
        data: (environment) => environment?.name ?? AppStrings.environmentsTitle,
        orElse: () => AppStrings.environmentsTitle,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => context.pop(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<bool>(
          context: context,
          builder: (_) => AddVariableDialog(environmentId: environmentId),
        ),
        child: const Icon(Icons.add_rounded),
      ),
      body: AdaptivePage(
        child: variablesAsync.when(
          loading: () => const AppLoading(),
          error: (_, _) => AppErrorState(
            onRetry: () =>
                ref.invalidate(environmentVariablesProvider(environmentId)),
          ),
          data: (variables) {
            final environment = environmentAsync.valueOrNull;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.lg),
                if (environment != null) ...[
                  if (environment.description != null &&
                      environment.description!.isNotEmpty)
                    Text(
                      environment.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      if (!environment.isActive)
                        AppButton(
                          label: AppStrings.setActiveEnvironment,
                          variant: AppButtonVariant.outline,
                          onPressed: () => ref
                              .read(environmentsRepositoryProvider)
                              .setActiveEnvironment(environment.id),
                        ),
                      const SizedBox(width: AppSpacing.sm),
                      AppButton(
                        label: AppStrings.editEnvironment,
                        variant: AppButtonVariant.ghost,
                        onPressed: () => showDialog<bool>(
                          context: context,
                          builder: (_) =>
                              EditEnvironmentDialog(environment: environment),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionGap),
                ],
                if (variables.isEmpty)
                  const Expanded(
                    child: AppEmptyState(
                      icon: Icons.data_object_rounded,
                      title: AppStrings.noVariables,
                      message: AppStrings.noVariablesMessage,
                    ),
                  )
                else
                  Expanded(
                    child: ListView(
                      children: variables
                          .map(
                            (variable) =>
                                EnvironmentVariableRow(variable: variable),
                          )
                          .toList(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

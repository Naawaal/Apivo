import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/page_container.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../../environments/presentation/environments_providers.dart';
import 'controllers/request_builder_controller.dart';
import 'widgets/active_environment_selector.dart';
import 'widgets/request_config_tabs.dart';
import 'widgets/request_url_bar.dart';
import 'widgets/response_panel.dart';
import 'widgets/save_request_dialog.dart';
import 'widgets/variables_helper.dart';

class RequestBuilderScreen extends ConsumerStatefulWidget {
  const RequestBuilderScreen({
    super.key,
    this.requestId,
    this.historyId,
  });

  final String? requestId;
  final String? historyId;

  @override
  ConsumerState<RequestBuilderScreen> createState() =>
      _RequestBuilderScreenState();
}

class _RequestBuilderScreenState extends ConsumerState<RequestBuilderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadInitialData());
  }

  Future<void> _loadInitialData() async {
    final notifier = ref.read(requestBuilderControllerProvider.notifier);
    if (widget.requestId != null) {
      await notifier.loadSavedRequest(widget.requestId!);
    } else if (widget.historyId != null) {
      await notifier.loadHistoryItem(widget.historyId!);
    } else {
      notifier.resetToNew();
    }
    notifier.loadActiveEnvironment();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(requestBuilderControllerProvider);
    final title = state.requestName ?? AppStrings.requestBuilderTitle;

    ref.listen(activeEnvironmentProvider, (previous, next) {
      ref.read(requestBuilderControllerProvider.notifier).loadActiveEnvironment();
    });

    ref.listen(activeEnvironmentVariablesProvider, (previous, next) {
      ref.read(requestBuilderControllerProvider.notifier).refreshVariables();
    });

    ref.listen(requestBuilderControllerProvider, (previous, next) {
      if (next.saveError != null &&
          next.saveError != previous?.saveError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.saveError!)),
        );
      }
    });

    return AppScaffold(
      title: title,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => context.pop(),
      ),
      body: PageContainer(
        alignTop: true,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.lg,
            bottom: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ActiveEnvironmentSelector(),
              SizedBox(height: AppSpacing.md),
              RequestUrlBar(),
              SizedBox(height: AppSpacing.md),
              VariablesHelper(),
              SizedBox(height: AppSpacing.sectionGap),
              Expanded(flex: 3, child: RequestConfigTabs()),
              SizedBox(height: AppSpacing.sectionGap),
              Expanded(flex: 2, child: ResponsePanel()),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showSaveRequestDialog(BuildContext context, WidgetRef ref) async {
  final state = ref.read(requestBuilderControllerProvider);
  final result = await showDialog<bool>(
    context: context,
    builder: (_) => SaveRequestDialog(
      initialName: state.requestName,
      initialCollectionId: state.collectionId,
    ),
  );
  if (result == true && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppStrings.requestSaved)),
    );
  }
}

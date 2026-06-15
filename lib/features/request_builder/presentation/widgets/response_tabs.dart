import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../domain/response_tab.dart';
import '../controllers/request_builder_controller.dart';

class ResponseTabs extends ConsumerStatefulWidget {
  const ResponseTabs({super.key});

  @override
  ConsumerState<ResponseTabs> createState() => _ResponseTabsState();
}

class _ResponseTabsState extends ConsumerState<ResponseTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final initialTab = ref.read(requestBuilderControllerProvider).responseTab;
    _tabController = TabController(
      length: ResponseTab.values.length,
      vsync: this,
      initialIndex: initialTab.index,
    );
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    ref
        .read(requestBuilderControllerProvider.notifier)
        .setResponseTab(ResponseTab.values[_tabController.index]);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(requestBuilderControllerProvider);
    final theme = Theme.of(context);
    final response = state.response;

    if (response == null) return const SizedBox.shrink();

    if (_tabController.index != state.responseTab.index) {
      _tabController.animateTo(state.responseTab.index);
    }

    final displayBody =
        response.body.isEmpty ? AppStrings.noResponseBody : response.body;
    final rawBody =
        response.rawBody.isEmpty ? AppStrings.noResponseBody : response.rawBody;
    final headers = response.headers;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (response.hasError) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Text(
              response.errorMessage!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
        ],
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: ResponseTab.values
              .map((tab) => Tab(text: tab.label))
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _ResponseScrollView(
                child: SelectableText(
                  displayBody,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              _ResponseScrollView(
                child: headers.isEmpty
                    ? Text(
                        AppStrings.noResponseBody,
                        style: theme.textTheme.bodySmall,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: headers.entries
                            .map(
                              (entry) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppSpacing.sm,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        entry.key,
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                          fontFamily: 'monospace',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        entry.value,
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          fontFamily: 'monospace',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),
              _ResponseScrollView(
                child: SelectableText(
                  rawBody,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              _ResponseScrollView(
                child: Center(
                  child: Text(
                    AppStrings.responsePreviewPlaceholder,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ResponseScrollView extends StatelessWidget {
  const _ResponseScrollView({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/request_config_tab.dart';
import '../controllers/request_builder_controller.dart';
import 'auth_editor.dart';
import 'body_editor.dart';
import 'headers_editor.dart';
import 'params_editor.dart';

class RequestConfigTabs extends ConsumerStatefulWidget {
  const RequestConfigTabs({super.key});

  @override
  ConsumerState<RequestConfigTabs> createState() => _RequestConfigTabsState();
}

class _RequestConfigTabsState extends ConsumerState<RequestConfigTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final initialTab = ref.read(requestBuilderControllerProvider).requestTab;
    _tabController = TabController(
      length: RequestConfigTab.values.length,
      vsync: this,
      initialIndex: initialTab.index,
    );
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    ref
        .read(requestBuilderControllerProvider.notifier)
        .setRequestTab(RequestConfigTab.values[_tabController.index]);
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

    if (_tabController.index != state.requestTab.index) {
      _tabController.animateTo(state.requestTab.index);
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: RequestConfigTab.values
                .map((tab) => Tab(text: tab.label))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ParamsEditor(),
                  HeadersEditor(),
                  AuthEditor(),
                  BodyEditor(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

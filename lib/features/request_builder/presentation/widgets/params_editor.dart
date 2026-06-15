import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../controllers/request_builder_controller.dart';
import 'key_value_editor.dart';

class ParamsEditor extends ConsumerWidget {
  const ParamsEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(requestBuilderControllerProvider);
    final notifier = ref.read(requestBuilderControllerProvider.notifier);

    return SingleChildScrollView(
      child: KeyValueEditor(
        items: state.queryParams,
        emptyMessage: AppStrings.paramsEmpty,
        onAdd: notifier.addQueryParam,
        onRemove: notifier.removeQueryParam,
        onUpdate: notifier.updateQueryParam,
      ),
    );
  }
}

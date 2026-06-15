import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/environments_repository.dart';
import '../domain/environment_model.dart';

final environmentsProvider = StreamProvider<List<EnvironmentModel>>((ref) {
  return ref.watch(environmentsRepositoryProvider).watchEnvironments();
});

final activeEnvironmentProvider = StreamProvider<EnvironmentModel?>((ref) {
  return ref.watch(environmentsRepositoryProvider).watchActiveEnvironment();
});

final environmentVariablesProvider =
    StreamProvider.family<List<EnvironmentVariableModel>, String>(
  (ref, environmentId) {
    return ref
        .watch(environmentsRepositoryProvider)
        .watchVariables(environmentId);
  },
);

final activeEnvironmentVariablesProvider =
    StreamProvider<List<EnvironmentVariableModel>>((ref) {
  final active = ref.watch(activeEnvironmentProvider);
  return active.when(
    data: (environment) {
      if (environment == null) {
        return Stream.value(const <EnvironmentVariableModel>[]);
      }
      return ref
          .watch(environmentsRepositoryProvider)
          .watchVariables(environment.id);
    },
    loading: () => Stream.value(const <EnvironmentVariableModel>[]),
    error: (_, _) => Stream.value(const <EnvironmentVariableModel>[]),
  );
});

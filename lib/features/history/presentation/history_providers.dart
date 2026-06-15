import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/request_history_repository.dart';
import '../domain/request_history_model.dart';

final requestHistoryProvider = StreamProvider<List<RequestHistoryModel>>((ref) {
  return ref.watch(requestHistoryRepositoryProvider).watchHistory();
});

final recentHistoryProvider = StreamProvider<List<RequestHistoryModel>>((ref) {
  return ref.watch(requestHistoryRepositoryProvider).watchRecent(limit: 5);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/saved_requests_repository.dart';
import '../domain/saved_request_model.dart';

final savedRequestsProvider = StreamProvider<List<SavedRequestModel>>((ref) {
  return ref.watch(savedRequestsRepositoryProvider).watchRequests();
});

final savedRequestsByCollectionProvider =
    StreamProvider.family<List<SavedRequestModel>, String>((ref, collectionId) {
  return ref
      .watch(savedRequestsRepositoryProvider)
      .watchRequestsByCollection(collectionId);
});

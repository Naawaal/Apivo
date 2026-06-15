import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/collections_repository.dart';
import '../domain/collection_model.dart';

final collectionsProvider = StreamProvider<List<CollectionModel>>((ref) {
  return ref.watch(collectionsRepositoryProvider).watchCollections();
});

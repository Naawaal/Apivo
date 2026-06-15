import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../database/app_database.dart';
import '../../../database/database_provider.dart';
import '../domain/collection_model.dart';

final collectionsRepositoryProvider = Provider<CollectionsRepository>((ref) {
  return CollectionsRepository(ref.watch(databaseProvider));
});

class CollectionsRepository {
  CollectionsRepository(this._db);

  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<CollectionModel>> watchCollections() {
    return _db.collectionsDao.watchAll().asyncMap((rows) async {
      final models = <CollectionModel>[];
      for (final row in rows) {
        final count = await _db.collectionsDao.countRequests(row.id);
        models.add(CollectionModel.fromRow(row, requestCount: count));
      }
      return models;
    });
  }

  Future<CollectionModel?> getCollectionById(String id) async {
    final row = await _db.collectionsDao.getById(id);
    if (row == null) return null;
    final count = await _db.collectionsDao.countRequests(id);
    return CollectionModel.fromRow(row, requestCount: count);
  }

  Future<CollectionModel> createCollection({
    required String name,
    String? description,
    String colorLabel = 'blue',
  }) async {
    final now = DateTime.now();
    final id = _uuid.v4();
    await _db.collectionsDao.insertCollection(
      CollectionsCompanion.insert(
        id: id,
        name: name,
        description: Value(description),
        colorLabel: Value(colorLabel),
        createdAt: now,
        updatedAt: now,
      ),
    );
    return CollectionModel.fromRow(
      Collection(
        id: id,
        name: name,
        description: description,
        colorLabel: colorLabel,
        createdAt: now,
        updatedAt: now,
        sortOrder: 0,
      ),
    );
  }

  Future<void> updateCollection(CollectionModel collection) async {
    await _db.collectionsDao.updateCollection(
      CollectionsCompanion(
        id: Value(collection.id),
        name: Value(collection.name),
        description: Value(collection.description),
        colorLabel: Value(collection.colorLabel),
        createdAt: Value(collection.createdAt),
        updatedAt: Value(DateTime.now()),
        sortOrder: Value(collection.sortOrder),
      ),
    );
  }

  Future<void> deleteCollection(String id) async {
    await _db.savedRequestsDao.deleteByCollection(id);
    await _db.collectionsDao.deleteCollection(id);
  }
}

import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase(
    driftDatabase(name: 'apivo_db'),
  );
  ref.onDispose(db.close);
  return db;
});

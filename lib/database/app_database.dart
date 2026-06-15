import 'package:drift/drift.dart';

import 'daos/collections_dao.dart';
import 'daos/environment_variables_dao.dart';
import 'daos/environments_dao.dart';
import 'daos/request_history_dao.dart';
import 'daos/saved_requests_dao.dart';
import 'tables/collections_table.dart';
import 'tables/environment_variables_table.dart';
import 'tables/environments_table.dart';
import 'tables/request_history_table.dart';
import 'tables/saved_requests_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Collections,
    SavedRequests,
    RequestHistory,
    Environments,
    EnvironmentVariables,
  ],
  daos: [
    CollectionsDao,
    SavedRequestsDao,
    RequestHistoryDao,
    EnvironmentsDao,
    EnvironmentVariablesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.createTable(environments);
            await migrator.createTable(environmentVariables);
            await migrator.addColumn(requestHistory, requestHistory.rawUrl);
            await migrator.addColumn(requestHistory, requestHistory.resolvedUrl);
            await migrator.addColumn(requestHistory, requestHistory.environmentId);
            await migrator.addColumn(
              requestHistory,
              requestHistory.environmentName,
            );
            await customStatement(
              'UPDATE request_history SET raw_url = url, resolved_url = url '
              'WHERE raw_url IS NULL',
            );
          }
        },
      );
}

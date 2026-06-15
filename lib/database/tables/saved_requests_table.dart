import 'package:drift/drift.dart';

class SavedRequests extends Table {
  TextColumn get id => text()();
  TextColumn get collectionId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get method => text()();
  TextColumn get url => text()();
  TextColumn get queryParamsJson => text().withDefault(const Constant('[]'))();
  TextColumn get headersJson => text().withDefault(const Constant('{}'))();
  TextColumn get authJson => text().withDefault(const Constant('{}'))();
  TextColumn get bodyType => text()();
  TextColumn get bodyJson => text().withDefault(const Constant('[]'))();
  TextColumn get bodyText => text().withDefault(const Constant(''))();
  IntColumn get timeoutSeconds => integer().withDefault(const Constant(30))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get lastSentAt => dateTime().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

import 'package:drift/drift.dart';

class RequestHistory extends Table {
  TextColumn get id => text()();
  TextColumn get savedRequestId => text().nullable()();
  TextColumn get method => text()();
  TextColumn get url => text()();
  TextColumn get rawUrl => text().nullable()();
  TextColumn get resolvedUrl => text().nullable()();
  TextColumn get environmentId => text().nullable()();
  TextColumn get environmentName => text().nullable()();
  TextColumn get requestHeadersJson => text().withDefault(const Constant('{}'))();
  TextColumn get requestBodyType => text()();
  TextColumn get requestBodyText => text().withDefault(const Constant(''))();
  IntColumn get statusCode => integer().nullable()();
  TextColumn get statusMessage => text().nullable()();
  TextColumn get responseHeadersJson => text().withDefault(const Constant('{}'))();
  TextColumn get responseBodyText => text().withDefault(const Constant(''))();
  BoolColumn get responseBodyTruncated =>
      boolean().withDefault(const Constant(false))();
  IntColumn get durationMs => integer().withDefault(const Constant(0))();
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get contentType => text().nullable()();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get sentAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

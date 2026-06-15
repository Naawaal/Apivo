// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_variables_dao.dart';

// ignore_for_file: type=lint
mixin _$EnvironmentVariablesDaoMixin on DatabaseAccessor<AppDatabase> {
  $EnvironmentVariablesTable get environmentVariables =>
      attachedDatabase.environmentVariables;
  EnvironmentVariablesDaoManager get managers =>
      EnvironmentVariablesDaoManager(this);
}

class EnvironmentVariablesDaoManager {
  final _$EnvironmentVariablesDaoMixin _db;
  EnvironmentVariablesDaoManager(this._db);
  $$EnvironmentVariablesTableTableManager get environmentVariables =>
      $$EnvironmentVariablesTableTableManager(
        _db.attachedDatabase,
        _db.environmentVariables,
      );
}

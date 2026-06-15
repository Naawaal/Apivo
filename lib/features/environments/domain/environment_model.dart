import '../../../database/app_database.dart';

class EnvironmentModel {
  const EnvironmentModel({
    required this.id,
    required this.name,
    this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.sortOrder,
    this.variableCount = 0,
    this.variables = const [],
  });

  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sortOrder;
  final int variableCount;
  final List<EnvironmentVariableModel> variables;

  EnvironmentModel copyWith({
    String? id,
    String? name,
    String? description,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? sortOrder,
    int? variableCount,
    List<EnvironmentVariableModel>? variables,
  }) {
    return EnvironmentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sortOrder: sortOrder ?? this.sortOrder,
      variableCount: variableCount ?? this.variableCount,
      variables: variables ?? this.variables,
    );
  }

  factory EnvironmentModel.fromRow(
    Environment row, {
    int variableCount = 0,
    List<EnvironmentVariableModel> variables = const [],
  }) {
    return EnvironmentModel(
      id: row.id,
      name: row.name,
      description: row.description,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      sortOrder: row.sortOrder,
      variableCount: variableCount,
      variables: variables,
    );
  }
}

class EnvironmentVariableModel {
  const EnvironmentVariableModel({
    required this.id,
    required this.environmentId,
    required this.key,
    required this.value,
    required this.isSecret,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
    required this.sortOrder,
  });

  final String id;
  final String environmentId;
  final String key;
  final String value;
  final bool isSecret;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sortOrder;

  String get token => '{{$key}}';

  EnvironmentVariableModel copyWith({
    String? id,
    String? environmentId,
    String? key,
    String? value,
    bool? isSecret,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? sortOrder,
  }) {
    return EnvironmentVariableModel(
      id: id ?? this.id,
      environmentId: environmentId ?? this.environmentId,
      key: key ?? this.key,
      value: value ?? this.value,
      isSecret: isSecret ?? this.isSecret,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  factory EnvironmentVariableModel.fromRow(EnvironmentVariable row) {
    return EnvironmentVariableModel(
      id: row.id,
      environmentId: row.environmentId,
      key: row.key,
      value: row.value,
      isSecret: row.isSecret,
      isEnabled: row.isEnabled,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      sortOrder: row.sortOrder,
    );
  }
}

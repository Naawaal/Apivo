// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorLabelMeta = const VerificationMeta(
    'colorLabel',
  );
  @override
  late final GeneratedColumn<String> colorLabel = GeneratedColumn<String>(
    'color_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('blue'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    colorLabel,
    createdAt,
    updatedAt,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Collection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('color_label')) {
      context.handle(
        _colorLabelMeta,
        colorLabel.isAcceptableOrUnknown(data['color_label']!, _colorLabelMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      colorLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_label'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final String id;
  final String name;
  final String? description;
  final String colorLabel;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sortOrder;
  const Collection({
    required this.id,
    required this.name,
    this.description,
    required this.colorLabel,
    required this.createdAt,
    required this.updatedAt,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['color_label'] = Variable<String>(colorLabel);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      colorLabel: Value(colorLabel),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      sortOrder: Value(sortOrder),
    );
  }

  factory Collection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      colorLabel: serializer.fromJson<String>(json['colorLabel']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'colorLabel': serializer.toJson<String>(colorLabel),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  Collection copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? colorLabel,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? sortOrder,
  }) => Collection(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    colorLabel: colorLabel ?? this.colorLabel,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      colorLabel: data.colorLabel.present
          ? data.colorLabel.value
          : this.colorLabel,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorLabel: $colorLabel, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    colorLabel,
    createdAt,
    updatedAt,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.colorLabel == this.colorLabel &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.sortOrder == this.sortOrder);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> colorLabel;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.colorLabel = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.colorLabel = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Collection> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? colorLabel,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (colorLabel != null) 'color_label': colorLabel,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? colorLabel,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      colorLabel: colorLabel ?? this.colorLabel,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (colorLabel.present) {
      map['color_label'] = Variable<String>(colorLabel.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('colorLabel: $colorLabel, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavedRequestsTable extends SavedRequests
    with TableInfo<$SavedRequestsTable, SavedRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
    'collection_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _queryParamsJsonMeta = const VerificationMeta(
    'queryParamsJson',
  );
  @override
  late final GeneratedColumn<String> queryParamsJson = GeneratedColumn<String>(
    'query_params_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _headersJsonMeta = const VerificationMeta(
    'headersJson',
  );
  @override
  late final GeneratedColumn<String> headersJson = GeneratedColumn<String>(
    'headers_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _authJsonMeta = const VerificationMeta(
    'authJson',
  );
  @override
  late final GeneratedColumn<String> authJson = GeneratedColumn<String>(
    'auth_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _bodyTypeMeta = const VerificationMeta(
    'bodyType',
  );
  @override
  late final GeneratedColumn<String> bodyType = GeneratedColumn<String>(
    'body_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyJsonMeta = const VerificationMeta(
    'bodyJson',
  );
  @override
  late final GeneratedColumn<String> bodyJson = GeneratedColumn<String>(
    'body_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _bodyTextMeta = const VerificationMeta(
    'bodyText',
  );
  @override
  late final GeneratedColumn<String> bodyText = GeneratedColumn<String>(
    'body_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _timeoutSecondsMeta = const VerificationMeta(
    'timeoutSeconds',
  );
  @override
  late final GeneratedColumn<int> timeoutSeconds = GeneratedColumn<int>(
    'timeout_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSentAtMeta = const VerificationMeta(
    'lastSentAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSentAt = GeneratedColumn<DateTime>(
    'last_sent_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    collectionId,
    name,
    method,
    url,
    queryParamsJson,
    headersJson,
    authJson,
    bodyType,
    bodyJson,
    bodyText,
    timeoutSeconds,
    createdAt,
    updatedAt,
    lastSentAt,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedRequest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('query_params_json')) {
      context.handle(
        _queryParamsJsonMeta,
        queryParamsJson.isAcceptableOrUnknown(
          data['query_params_json']!,
          _queryParamsJsonMeta,
        ),
      );
    }
    if (data.containsKey('headers_json')) {
      context.handle(
        _headersJsonMeta,
        headersJson.isAcceptableOrUnknown(
          data['headers_json']!,
          _headersJsonMeta,
        ),
      );
    }
    if (data.containsKey('auth_json')) {
      context.handle(
        _authJsonMeta,
        authJson.isAcceptableOrUnknown(data['auth_json']!, _authJsonMeta),
      );
    }
    if (data.containsKey('body_type')) {
      context.handle(
        _bodyTypeMeta,
        bodyType.isAcceptableOrUnknown(data['body_type']!, _bodyTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyTypeMeta);
    }
    if (data.containsKey('body_json')) {
      context.handle(
        _bodyJsonMeta,
        bodyJson.isAcceptableOrUnknown(data['body_json']!, _bodyJsonMeta),
      );
    }
    if (data.containsKey('body_text')) {
      context.handle(
        _bodyTextMeta,
        bodyText.isAcceptableOrUnknown(data['body_text']!, _bodyTextMeta),
      );
    }
    if (data.containsKey('timeout_seconds')) {
      context.handle(
        _timeoutSecondsMeta,
        timeoutSeconds.isAcceptableOrUnknown(
          data['timeout_seconds']!,
          _timeoutSecondsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('last_sent_at')) {
      context.handle(
        _lastSentAtMeta,
        lastSentAt.isAcceptableOrUnknown(
          data['last_sent_at']!,
          _lastSentAtMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedRequest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      queryParamsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query_params_json'],
      )!,
      headersJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}headers_json'],
      )!,
      authJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}auth_json'],
      )!,
      bodyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_type'],
      )!,
      bodyJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_json'],
      )!,
      bodyText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_text'],
      )!,
      timeoutSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timeout_seconds'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      lastSentAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sent_at'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $SavedRequestsTable createAlias(String alias) {
    return $SavedRequestsTable(attachedDatabase, alias);
  }
}

class SavedRequest extends DataClass implements Insertable<SavedRequest> {
  final String id;
  final String? collectionId;
  final String name;
  final String method;
  final String url;
  final String queryParamsJson;
  final String headersJson;
  final String authJson;
  final String bodyType;
  final String bodyJson;
  final String bodyText;
  final int timeoutSeconds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastSentAt;
  final int sortOrder;
  const SavedRequest({
    required this.id,
    this.collectionId,
    required this.name,
    required this.method,
    required this.url,
    required this.queryParamsJson,
    required this.headersJson,
    required this.authJson,
    required this.bodyType,
    required this.bodyJson,
    required this.bodyText,
    required this.timeoutSeconds,
    required this.createdAt,
    required this.updatedAt,
    this.lastSentAt,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || collectionId != null) {
      map['collection_id'] = Variable<String>(collectionId);
    }
    map['name'] = Variable<String>(name);
    map['method'] = Variable<String>(method);
    map['url'] = Variable<String>(url);
    map['query_params_json'] = Variable<String>(queryParamsJson);
    map['headers_json'] = Variable<String>(headersJson);
    map['auth_json'] = Variable<String>(authJson);
    map['body_type'] = Variable<String>(bodyType);
    map['body_json'] = Variable<String>(bodyJson);
    map['body_text'] = Variable<String>(bodyText);
    map['timeout_seconds'] = Variable<int>(timeoutSeconds);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastSentAt != null) {
      map['last_sent_at'] = Variable<DateTime>(lastSentAt);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  SavedRequestsCompanion toCompanion(bool nullToAbsent) {
    return SavedRequestsCompanion(
      id: Value(id),
      collectionId: collectionId == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionId),
      name: Value(name),
      method: Value(method),
      url: Value(url),
      queryParamsJson: Value(queryParamsJson),
      headersJson: Value(headersJson),
      authJson: Value(authJson),
      bodyType: Value(bodyType),
      bodyJson: Value(bodyJson),
      bodyText: Value(bodyText),
      timeoutSeconds: Value(timeoutSeconds),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastSentAt: lastSentAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSentAt),
      sortOrder: Value(sortOrder),
    );
  }

  factory SavedRequest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedRequest(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String?>(json['collectionId']),
      name: serializer.fromJson<String>(json['name']),
      method: serializer.fromJson<String>(json['method']),
      url: serializer.fromJson<String>(json['url']),
      queryParamsJson: serializer.fromJson<String>(json['queryParamsJson']),
      headersJson: serializer.fromJson<String>(json['headersJson']),
      authJson: serializer.fromJson<String>(json['authJson']),
      bodyType: serializer.fromJson<String>(json['bodyType']),
      bodyJson: serializer.fromJson<String>(json['bodyJson']),
      bodyText: serializer.fromJson<String>(json['bodyText']),
      timeoutSeconds: serializer.fromJson<int>(json['timeoutSeconds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastSentAt: serializer.fromJson<DateTime?>(json['lastSentAt']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collectionId': serializer.toJson<String?>(collectionId),
      'name': serializer.toJson<String>(name),
      'method': serializer.toJson<String>(method),
      'url': serializer.toJson<String>(url),
      'queryParamsJson': serializer.toJson<String>(queryParamsJson),
      'headersJson': serializer.toJson<String>(headersJson),
      'authJson': serializer.toJson<String>(authJson),
      'bodyType': serializer.toJson<String>(bodyType),
      'bodyJson': serializer.toJson<String>(bodyJson),
      'bodyText': serializer.toJson<String>(bodyText),
      'timeoutSeconds': serializer.toJson<int>(timeoutSeconds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastSentAt': serializer.toJson<DateTime?>(lastSentAt),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  SavedRequest copyWith({
    String? id,
    Value<String?> collectionId = const Value.absent(),
    String? name,
    String? method,
    String? url,
    String? queryParamsJson,
    String? headersJson,
    String? authJson,
    String? bodyType,
    String? bodyJson,
    String? bodyText,
    int? timeoutSeconds,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> lastSentAt = const Value.absent(),
    int? sortOrder,
  }) => SavedRequest(
    id: id ?? this.id,
    collectionId: collectionId.present ? collectionId.value : this.collectionId,
    name: name ?? this.name,
    method: method ?? this.method,
    url: url ?? this.url,
    queryParamsJson: queryParamsJson ?? this.queryParamsJson,
    headersJson: headersJson ?? this.headersJson,
    authJson: authJson ?? this.authJson,
    bodyType: bodyType ?? this.bodyType,
    bodyJson: bodyJson ?? this.bodyJson,
    bodyText: bodyText ?? this.bodyText,
    timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastSentAt: lastSentAt.present ? lastSentAt.value : this.lastSentAt,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  SavedRequest copyWithCompanion(SavedRequestsCompanion data) {
    return SavedRequest(
      id: data.id.present ? data.id.value : this.id,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      name: data.name.present ? data.name.value : this.name,
      method: data.method.present ? data.method.value : this.method,
      url: data.url.present ? data.url.value : this.url,
      queryParamsJson: data.queryParamsJson.present
          ? data.queryParamsJson.value
          : this.queryParamsJson,
      headersJson: data.headersJson.present
          ? data.headersJson.value
          : this.headersJson,
      authJson: data.authJson.present ? data.authJson.value : this.authJson,
      bodyType: data.bodyType.present ? data.bodyType.value : this.bodyType,
      bodyJson: data.bodyJson.present ? data.bodyJson.value : this.bodyJson,
      bodyText: data.bodyText.present ? data.bodyText.value : this.bodyText,
      timeoutSeconds: data.timeoutSeconds.present
          ? data.timeoutSeconds.value
          : this.timeoutSeconds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSentAt: data.lastSentAt.present
          ? data.lastSentAt.value
          : this.lastSentAt,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedRequest(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('name: $name, ')
          ..write('method: $method, ')
          ..write('url: $url, ')
          ..write('queryParamsJson: $queryParamsJson, ')
          ..write('headersJson: $headersJson, ')
          ..write('authJson: $authJson, ')
          ..write('bodyType: $bodyType, ')
          ..write('bodyJson: $bodyJson, ')
          ..write('bodyText: $bodyText, ')
          ..write('timeoutSeconds: $timeoutSeconds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSentAt: $lastSentAt, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    collectionId,
    name,
    method,
    url,
    queryParamsJson,
    headersJson,
    authJson,
    bodyType,
    bodyJson,
    bodyText,
    timeoutSeconds,
    createdAt,
    updatedAt,
    lastSentAt,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedRequest &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.name == this.name &&
          other.method == this.method &&
          other.url == this.url &&
          other.queryParamsJson == this.queryParamsJson &&
          other.headersJson == this.headersJson &&
          other.authJson == this.authJson &&
          other.bodyType == this.bodyType &&
          other.bodyJson == this.bodyJson &&
          other.bodyText == this.bodyText &&
          other.timeoutSeconds == this.timeoutSeconds &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastSentAt == this.lastSentAt &&
          other.sortOrder == this.sortOrder);
}

class SavedRequestsCompanion extends UpdateCompanion<SavedRequest> {
  final Value<String> id;
  final Value<String?> collectionId;
  final Value<String> name;
  final Value<String> method;
  final Value<String> url;
  final Value<String> queryParamsJson;
  final Value<String> headersJson;
  final Value<String> authJson;
  final Value<String> bodyType;
  final Value<String> bodyJson;
  final Value<String> bodyText;
  final Value<int> timeoutSeconds;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> lastSentAt;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const SavedRequestsCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.name = const Value.absent(),
    this.method = const Value.absent(),
    this.url = const Value.absent(),
    this.queryParamsJson = const Value.absent(),
    this.headersJson = const Value.absent(),
    this.authJson = const Value.absent(),
    this.bodyType = const Value.absent(),
    this.bodyJson = const Value.absent(),
    this.bodyText = const Value.absent(),
    this.timeoutSeconds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSentAt = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavedRequestsCompanion.insert({
    required String id,
    this.collectionId = const Value.absent(),
    required String name,
    required String method,
    required String url,
    this.queryParamsJson = const Value.absent(),
    this.headersJson = const Value.absent(),
    this.authJson = const Value.absent(),
    required String bodyType,
    this.bodyJson = const Value.absent(),
    this.bodyText = const Value.absent(),
    this.timeoutSeconds = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.lastSentAt = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       method = Value(method),
       url = Value(url),
       bodyType = Value(bodyType),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SavedRequest> custom({
    Expression<String>? id,
    Expression<String>? collectionId,
    Expression<String>? name,
    Expression<String>? method,
    Expression<String>? url,
    Expression<String>? queryParamsJson,
    Expression<String>? headersJson,
    Expression<String>? authJson,
    Expression<String>? bodyType,
    Expression<String>? bodyJson,
    Expression<String>? bodyText,
    Expression<int>? timeoutSeconds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastSentAt,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (name != null) 'name': name,
      if (method != null) 'method': method,
      if (url != null) 'url': url,
      if (queryParamsJson != null) 'query_params_json': queryParamsJson,
      if (headersJson != null) 'headers_json': headersJson,
      if (authJson != null) 'auth_json': authJson,
      if (bodyType != null) 'body_type': bodyType,
      if (bodyJson != null) 'body_json': bodyJson,
      if (bodyText != null) 'body_text': bodyText,
      if (timeoutSeconds != null) 'timeout_seconds': timeoutSeconds,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastSentAt != null) 'last_sent_at': lastSentAt,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavedRequestsCompanion copyWith({
    Value<String>? id,
    Value<String?>? collectionId,
    Value<String>? name,
    Value<String>? method,
    Value<String>? url,
    Value<String>? queryParamsJson,
    Value<String>? headersJson,
    Value<String>? authJson,
    Value<String>? bodyType,
    Value<String>? bodyJson,
    Value<String>? bodyText,
    Value<int>? timeoutSeconds,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? lastSentAt,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return SavedRequestsCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      name: name ?? this.name,
      method: method ?? this.method,
      url: url ?? this.url,
      queryParamsJson: queryParamsJson ?? this.queryParamsJson,
      headersJson: headersJson ?? this.headersJson,
      authJson: authJson ?? this.authJson,
      bodyType: bodyType ?? this.bodyType,
      bodyJson: bodyJson ?? this.bodyJson,
      bodyText: bodyText ?? this.bodyText,
      timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSentAt: lastSentAt ?? this.lastSentAt,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (queryParamsJson.present) {
      map['query_params_json'] = Variable<String>(queryParamsJson.value);
    }
    if (headersJson.present) {
      map['headers_json'] = Variable<String>(headersJson.value);
    }
    if (authJson.present) {
      map['auth_json'] = Variable<String>(authJson.value);
    }
    if (bodyType.present) {
      map['body_type'] = Variable<String>(bodyType.value);
    }
    if (bodyJson.present) {
      map['body_json'] = Variable<String>(bodyJson.value);
    }
    if (bodyText.present) {
      map['body_text'] = Variable<String>(bodyText.value);
    }
    if (timeoutSeconds.present) {
      map['timeout_seconds'] = Variable<int>(timeoutSeconds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastSentAt.present) {
      map['last_sent_at'] = Variable<DateTime>(lastSentAt.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedRequestsCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('name: $name, ')
          ..write('method: $method, ')
          ..write('url: $url, ')
          ..write('queryParamsJson: $queryParamsJson, ')
          ..write('headersJson: $headersJson, ')
          ..write('authJson: $authJson, ')
          ..write('bodyType: $bodyType, ')
          ..write('bodyJson: $bodyJson, ')
          ..write('bodyText: $bodyText, ')
          ..write('timeoutSeconds: $timeoutSeconds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSentAt: $lastSentAt, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RequestHistoryTable extends RequestHistory
    with TableInfo<$RequestHistoryTable, RequestHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedRequestIdMeta = const VerificationMeta(
    'savedRequestId',
  );
  @override
  late final GeneratedColumn<String> savedRequestId = GeneratedColumn<String>(
    'saved_request_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawUrlMeta = const VerificationMeta('rawUrl');
  @override
  late final GeneratedColumn<String> rawUrl = GeneratedColumn<String>(
    'raw_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resolvedUrlMeta = const VerificationMeta(
    'resolvedUrl',
  );
  @override
  late final GeneratedColumn<String> resolvedUrl = GeneratedColumn<String>(
    'resolved_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _environmentIdMeta = const VerificationMeta(
    'environmentId',
  );
  @override
  late final GeneratedColumn<String> environmentId = GeneratedColumn<String>(
    'environment_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _environmentNameMeta = const VerificationMeta(
    'environmentName',
  );
  @override
  late final GeneratedColumn<String> environmentName = GeneratedColumn<String>(
    'environment_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requestHeadersJsonMeta =
      const VerificationMeta('requestHeadersJson');
  @override
  late final GeneratedColumn<String> requestHeadersJson =
      GeneratedColumn<String>(
        'request_headers_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('{}'),
      );
  static const VerificationMeta _requestBodyTypeMeta = const VerificationMeta(
    'requestBodyType',
  );
  @override
  late final GeneratedColumn<String> requestBodyType = GeneratedColumn<String>(
    'request_body_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requestBodyTextMeta = const VerificationMeta(
    'requestBodyText',
  );
  @override
  late final GeneratedColumn<String> requestBodyText = GeneratedColumn<String>(
    'request_body_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _statusCodeMeta = const VerificationMeta(
    'statusCode',
  );
  @override
  late final GeneratedColumn<int> statusCode = GeneratedColumn<int>(
    'status_code',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMessageMeta = const VerificationMeta(
    'statusMessage',
  );
  @override
  late final GeneratedColumn<String> statusMessage = GeneratedColumn<String>(
    'status_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _responseHeadersJsonMeta =
      const VerificationMeta('responseHeadersJson');
  @override
  late final GeneratedColumn<String> responseHeadersJson =
      GeneratedColumn<String>(
        'response_headers_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('{}'),
      );
  static const VerificationMeta _responseBodyTextMeta = const VerificationMeta(
    'responseBodyText',
  );
  @override
  late final GeneratedColumn<String> responseBodyText = GeneratedColumn<String>(
    'response_body_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _responseBodyTruncatedMeta =
      const VerificationMeta('responseBodyTruncated');
  @override
  late final GeneratedColumn<bool> responseBodyTruncated =
      GeneratedColumn<bool>(
        'response_body_truncated',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("response_body_truncated" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  @override
  late final GeneratedColumn<DateTime> sentAt = GeneratedColumn<DateTime>(
    'sent_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    savedRequestId,
    method,
    url,
    rawUrl,
    resolvedUrl,
    environmentId,
    environmentName,
    requestHeadersJson,
    requestBodyType,
    requestBodyText,
    statusCode,
    statusMessage,
    responseHeadersJson,
    responseBodyText,
    responseBodyTruncated,
    durationMs,
    sizeBytes,
    contentType,
    errorMessage,
    sentAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<RequestHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('saved_request_id')) {
      context.handle(
        _savedRequestIdMeta,
        savedRequestId.isAcceptableOrUnknown(
          data['saved_request_id']!,
          _savedRequestIdMeta,
        ),
      );
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('raw_url')) {
      context.handle(
        _rawUrlMeta,
        rawUrl.isAcceptableOrUnknown(data['raw_url']!, _rawUrlMeta),
      );
    }
    if (data.containsKey('resolved_url')) {
      context.handle(
        _resolvedUrlMeta,
        resolvedUrl.isAcceptableOrUnknown(
          data['resolved_url']!,
          _resolvedUrlMeta,
        ),
      );
    }
    if (data.containsKey('environment_id')) {
      context.handle(
        _environmentIdMeta,
        environmentId.isAcceptableOrUnknown(
          data['environment_id']!,
          _environmentIdMeta,
        ),
      );
    }
    if (data.containsKey('environment_name')) {
      context.handle(
        _environmentNameMeta,
        environmentName.isAcceptableOrUnknown(
          data['environment_name']!,
          _environmentNameMeta,
        ),
      );
    }
    if (data.containsKey('request_headers_json')) {
      context.handle(
        _requestHeadersJsonMeta,
        requestHeadersJson.isAcceptableOrUnknown(
          data['request_headers_json']!,
          _requestHeadersJsonMeta,
        ),
      );
    }
    if (data.containsKey('request_body_type')) {
      context.handle(
        _requestBodyTypeMeta,
        requestBodyType.isAcceptableOrUnknown(
          data['request_body_type']!,
          _requestBodyTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requestBodyTypeMeta);
    }
    if (data.containsKey('request_body_text')) {
      context.handle(
        _requestBodyTextMeta,
        requestBodyText.isAcceptableOrUnknown(
          data['request_body_text']!,
          _requestBodyTextMeta,
        ),
      );
    }
    if (data.containsKey('status_code')) {
      context.handle(
        _statusCodeMeta,
        statusCode.isAcceptableOrUnknown(data['status_code']!, _statusCodeMeta),
      );
    }
    if (data.containsKey('status_message')) {
      context.handle(
        _statusMessageMeta,
        statusMessage.isAcceptableOrUnknown(
          data['status_message']!,
          _statusMessageMeta,
        ),
      );
    }
    if (data.containsKey('response_headers_json')) {
      context.handle(
        _responseHeadersJsonMeta,
        responseHeadersJson.isAcceptableOrUnknown(
          data['response_headers_json']!,
          _responseHeadersJsonMeta,
        ),
      );
    }
    if (data.containsKey('response_body_text')) {
      context.handle(
        _responseBodyTextMeta,
        responseBodyText.isAcceptableOrUnknown(
          data['response_body_text']!,
          _responseBodyTextMeta,
        ),
      );
    }
    if (data.containsKey('response_body_truncated')) {
      context.handle(
        _responseBodyTruncatedMeta,
        responseBodyTruncated.isAcceptableOrUnknown(
          data['response_body_truncated']!,
          _responseBodyTruncatedMeta,
        ),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('sent_at')) {
      context.handle(
        _sentAtMeta,
        sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta),
      );
    } else if (isInserting) {
      context.missing(_sentAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RequestHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      savedRequestId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saved_request_id'],
      ),
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      rawUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_url'],
      ),
      resolvedUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resolved_url'],
      ),
      environmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}environment_id'],
      ),
      environmentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}environment_name'],
      ),
      requestHeadersJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_headers_json'],
      )!,
      requestBodyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_body_type'],
      )!,
      requestBodyText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_body_text'],
      )!,
      statusCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_code'],
      ),
      statusMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_message'],
      ),
      responseHeadersJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response_headers_json'],
      )!,
      responseBodyText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response_body_text'],
      )!,
      responseBodyTruncated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}response_body_truncated'],
      )!,
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      ),
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      sentAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sent_at'],
      )!,
    );
  }

  @override
  $RequestHistoryTable createAlias(String alias) {
    return $RequestHistoryTable(attachedDatabase, alias);
  }
}

class RequestHistoryData extends DataClass
    implements Insertable<RequestHistoryData> {
  final String id;
  final String? savedRequestId;
  final String method;
  final String url;
  final String? rawUrl;
  final String? resolvedUrl;
  final String? environmentId;
  final String? environmentName;
  final String requestHeadersJson;
  final String requestBodyType;
  final String requestBodyText;
  final int? statusCode;
  final String? statusMessage;
  final String responseHeadersJson;
  final String responseBodyText;
  final bool responseBodyTruncated;
  final int durationMs;
  final int sizeBytes;
  final String? contentType;
  final String? errorMessage;
  final DateTime sentAt;
  const RequestHistoryData({
    required this.id,
    this.savedRequestId,
    required this.method,
    required this.url,
    this.rawUrl,
    this.resolvedUrl,
    this.environmentId,
    this.environmentName,
    required this.requestHeadersJson,
    required this.requestBodyType,
    required this.requestBodyText,
    this.statusCode,
    this.statusMessage,
    required this.responseHeadersJson,
    required this.responseBodyText,
    required this.responseBodyTruncated,
    required this.durationMs,
    required this.sizeBytes,
    this.contentType,
    this.errorMessage,
    required this.sentAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || savedRequestId != null) {
      map['saved_request_id'] = Variable<String>(savedRequestId);
    }
    map['method'] = Variable<String>(method);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || rawUrl != null) {
      map['raw_url'] = Variable<String>(rawUrl);
    }
    if (!nullToAbsent || resolvedUrl != null) {
      map['resolved_url'] = Variable<String>(resolvedUrl);
    }
    if (!nullToAbsent || environmentId != null) {
      map['environment_id'] = Variable<String>(environmentId);
    }
    if (!nullToAbsent || environmentName != null) {
      map['environment_name'] = Variable<String>(environmentName);
    }
    map['request_headers_json'] = Variable<String>(requestHeadersJson);
    map['request_body_type'] = Variable<String>(requestBodyType);
    map['request_body_text'] = Variable<String>(requestBodyText);
    if (!nullToAbsent || statusCode != null) {
      map['status_code'] = Variable<int>(statusCode);
    }
    if (!nullToAbsent || statusMessage != null) {
      map['status_message'] = Variable<String>(statusMessage);
    }
    map['response_headers_json'] = Variable<String>(responseHeadersJson);
    map['response_body_text'] = Variable<String>(responseBodyText);
    map['response_body_truncated'] = Variable<bool>(responseBodyTruncated);
    map['duration_ms'] = Variable<int>(durationMs);
    map['size_bytes'] = Variable<int>(sizeBytes);
    if (!nullToAbsent || contentType != null) {
      map['content_type'] = Variable<String>(contentType);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['sent_at'] = Variable<DateTime>(sentAt);
    return map;
  }

  RequestHistoryCompanion toCompanion(bool nullToAbsent) {
    return RequestHistoryCompanion(
      id: Value(id),
      savedRequestId: savedRequestId == null && nullToAbsent
          ? const Value.absent()
          : Value(savedRequestId),
      method: Value(method),
      url: Value(url),
      rawUrl: rawUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(rawUrl),
      resolvedUrl: resolvedUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedUrl),
      environmentId: environmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(environmentId),
      environmentName: environmentName == null && nullToAbsent
          ? const Value.absent()
          : Value(environmentName),
      requestHeadersJson: Value(requestHeadersJson),
      requestBodyType: Value(requestBodyType),
      requestBodyText: Value(requestBodyText),
      statusCode: statusCode == null && nullToAbsent
          ? const Value.absent()
          : Value(statusCode),
      statusMessage: statusMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(statusMessage),
      responseHeadersJson: Value(responseHeadersJson),
      responseBodyText: Value(responseBodyText),
      responseBodyTruncated: Value(responseBodyTruncated),
      durationMs: Value(durationMs),
      sizeBytes: Value(sizeBytes),
      contentType: contentType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentType),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      sentAt: Value(sentAt),
    );
  }

  factory RequestHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestHistoryData(
      id: serializer.fromJson<String>(json['id']),
      savedRequestId: serializer.fromJson<String?>(json['savedRequestId']),
      method: serializer.fromJson<String>(json['method']),
      url: serializer.fromJson<String>(json['url']),
      rawUrl: serializer.fromJson<String?>(json['rawUrl']),
      resolvedUrl: serializer.fromJson<String?>(json['resolvedUrl']),
      environmentId: serializer.fromJson<String?>(json['environmentId']),
      environmentName: serializer.fromJson<String?>(json['environmentName']),
      requestHeadersJson: serializer.fromJson<String>(
        json['requestHeadersJson'],
      ),
      requestBodyType: serializer.fromJson<String>(json['requestBodyType']),
      requestBodyText: serializer.fromJson<String>(json['requestBodyText']),
      statusCode: serializer.fromJson<int?>(json['statusCode']),
      statusMessage: serializer.fromJson<String?>(json['statusMessage']),
      responseHeadersJson: serializer.fromJson<String>(
        json['responseHeadersJson'],
      ),
      responseBodyText: serializer.fromJson<String>(json['responseBodyText']),
      responseBodyTruncated: serializer.fromJson<bool>(
        json['responseBodyTruncated'],
      ),
      durationMs: serializer.fromJson<int>(json['durationMs']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      contentType: serializer.fromJson<String?>(json['contentType']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      sentAt: serializer.fromJson<DateTime>(json['sentAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'savedRequestId': serializer.toJson<String?>(savedRequestId),
      'method': serializer.toJson<String>(method),
      'url': serializer.toJson<String>(url),
      'rawUrl': serializer.toJson<String?>(rawUrl),
      'resolvedUrl': serializer.toJson<String?>(resolvedUrl),
      'environmentId': serializer.toJson<String?>(environmentId),
      'environmentName': serializer.toJson<String?>(environmentName),
      'requestHeadersJson': serializer.toJson<String>(requestHeadersJson),
      'requestBodyType': serializer.toJson<String>(requestBodyType),
      'requestBodyText': serializer.toJson<String>(requestBodyText),
      'statusCode': serializer.toJson<int?>(statusCode),
      'statusMessage': serializer.toJson<String?>(statusMessage),
      'responseHeadersJson': serializer.toJson<String>(responseHeadersJson),
      'responseBodyText': serializer.toJson<String>(responseBodyText),
      'responseBodyTruncated': serializer.toJson<bool>(responseBodyTruncated),
      'durationMs': serializer.toJson<int>(durationMs),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'contentType': serializer.toJson<String?>(contentType),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'sentAt': serializer.toJson<DateTime>(sentAt),
    };
  }

  RequestHistoryData copyWith({
    String? id,
    Value<String?> savedRequestId = const Value.absent(),
    String? method,
    String? url,
    Value<String?> rawUrl = const Value.absent(),
    Value<String?> resolvedUrl = const Value.absent(),
    Value<String?> environmentId = const Value.absent(),
    Value<String?> environmentName = const Value.absent(),
    String? requestHeadersJson,
    String? requestBodyType,
    String? requestBodyText,
    Value<int?> statusCode = const Value.absent(),
    Value<String?> statusMessage = const Value.absent(),
    String? responseHeadersJson,
    String? responseBodyText,
    bool? responseBodyTruncated,
    int? durationMs,
    int? sizeBytes,
    Value<String?> contentType = const Value.absent(),
    Value<String?> errorMessage = const Value.absent(),
    DateTime? sentAt,
  }) => RequestHistoryData(
    id: id ?? this.id,
    savedRequestId: savedRequestId.present
        ? savedRequestId.value
        : this.savedRequestId,
    method: method ?? this.method,
    url: url ?? this.url,
    rawUrl: rawUrl.present ? rawUrl.value : this.rawUrl,
    resolvedUrl: resolvedUrl.present ? resolvedUrl.value : this.resolvedUrl,
    environmentId: environmentId.present
        ? environmentId.value
        : this.environmentId,
    environmentName: environmentName.present
        ? environmentName.value
        : this.environmentName,
    requestHeadersJson: requestHeadersJson ?? this.requestHeadersJson,
    requestBodyType: requestBodyType ?? this.requestBodyType,
    requestBodyText: requestBodyText ?? this.requestBodyText,
    statusCode: statusCode.present ? statusCode.value : this.statusCode,
    statusMessage: statusMessage.present
        ? statusMessage.value
        : this.statusMessage,
    responseHeadersJson: responseHeadersJson ?? this.responseHeadersJson,
    responseBodyText: responseBodyText ?? this.responseBodyText,
    responseBodyTruncated: responseBodyTruncated ?? this.responseBodyTruncated,
    durationMs: durationMs ?? this.durationMs,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    contentType: contentType.present ? contentType.value : this.contentType,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    sentAt: sentAt ?? this.sentAt,
  );
  RequestHistoryData copyWithCompanion(RequestHistoryCompanion data) {
    return RequestHistoryData(
      id: data.id.present ? data.id.value : this.id,
      savedRequestId: data.savedRequestId.present
          ? data.savedRequestId.value
          : this.savedRequestId,
      method: data.method.present ? data.method.value : this.method,
      url: data.url.present ? data.url.value : this.url,
      rawUrl: data.rawUrl.present ? data.rawUrl.value : this.rawUrl,
      resolvedUrl: data.resolvedUrl.present
          ? data.resolvedUrl.value
          : this.resolvedUrl,
      environmentId: data.environmentId.present
          ? data.environmentId.value
          : this.environmentId,
      environmentName: data.environmentName.present
          ? data.environmentName.value
          : this.environmentName,
      requestHeadersJson: data.requestHeadersJson.present
          ? data.requestHeadersJson.value
          : this.requestHeadersJson,
      requestBodyType: data.requestBodyType.present
          ? data.requestBodyType.value
          : this.requestBodyType,
      requestBodyText: data.requestBodyText.present
          ? data.requestBodyText.value
          : this.requestBodyText,
      statusCode: data.statusCode.present
          ? data.statusCode.value
          : this.statusCode,
      statusMessage: data.statusMessage.present
          ? data.statusMessage.value
          : this.statusMessage,
      responseHeadersJson: data.responseHeadersJson.present
          ? data.responseHeadersJson.value
          : this.responseHeadersJson,
      responseBodyText: data.responseBodyText.present
          ? data.responseBodyText.value
          : this.responseBodyText,
      responseBodyTruncated: data.responseBodyTruncated.present
          ? data.responseBodyTruncated.value
          : this.responseBodyTruncated,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      sentAt: data.sentAt.present ? data.sentAt.value : this.sentAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RequestHistoryData(')
          ..write('id: $id, ')
          ..write('savedRequestId: $savedRequestId, ')
          ..write('method: $method, ')
          ..write('url: $url, ')
          ..write('rawUrl: $rawUrl, ')
          ..write('resolvedUrl: $resolvedUrl, ')
          ..write('environmentId: $environmentId, ')
          ..write('environmentName: $environmentName, ')
          ..write('requestHeadersJson: $requestHeadersJson, ')
          ..write('requestBodyType: $requestBodyType, ')
          ..write('requestBodyText: $requestBodyText, ')
          ..write('statusCode: $statusCode, ')
          ..write('statusMessage: $statusMessage, ')
          ..write('responseHeadersJson: $responseHeadersJson, ')
          ..write('responseBodyText: $responseBodyText, ')
          ..write('responseBodyTruncated: $responseBodyTruncated, ')
          ..write('durationMs: $durationMs, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('contentType: $contentType, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('sentAt: $sentAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    savedRequestId,
    method,
    url,
    rawUrl,
    resolvedUrl,
    environmentId,
    environmentName,
    requestHeadersJson,
    requestBodyType,
    requestBodyText,
    statusCode,
    statusMessage,
    responseHeadersJson,
    responseBodyText,
    responseBodyTruncated,
    durationMs,
    sizeBytes,
    contentType,
    errorMessage,
    sentAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequestHistoryData &&
          other.id == this.id &&
          other.savedRequestId == this.savedRequestId &&
          other.method == this.method &&
          other.url == this.url &&
          other.rawUrl == this.rawUrl &&
          other.resolvedUrl == this.resolvedUrl &&
          other.environmentId == this.environmentId &&
          other.environmentName == this.environmentName &&
          other.requestHeadersJson == this.requestHeadersJson &&
          other.requestBodyType == this.requestBodyType &&
          other.requestBodyText == this.requestBodyText &&
          other.statusCode == this.statusCode &&
          other.statusMessage == this.statusMessage &&
          other.responseHeadersJson == this.responseHeadersJson &&
          other.responseBodyText == this.responseBodyText &&
          other.responseBodyTruncated == this.responseBodyTruncated &&
          other.durationMs == this.durationMs &&
          other.sizeBytes == this.sizeBytes &&
          other.contentType == this.contentType &&
          other.errorMessage == this.errorMessage &&
          other.sentAt == this.sentAt);
}

class RequestHistoryCompanion extends UpdateCompanion<RequestHistoryData> {
  final Value<String> id;
  final Value<String?> savedRequestId;
  final Value<String> method;
  final Value<String> url;
  final Value<String?> rawUrl;
  final Value<String?> resolvedUrl;
  final Value<String?> environmentId;
  final Value<String?> environmentName;
  final Value<String> requestHeadersJson;
  final Value<String> requestBodyType;
  final Value<String> requestBodyText;
  final Value<int?> statusCode;
  final Value<String?> statusMessage;
  final Value<String> responseHeadersJson;
  final Value<String> responseBodyText;
  final Value<bool> responseBodyTruncated;
  final Value<int> durationMs;
  final Value<int> sizeBytes;
  final Value<String?> contentType;
  final Value<String?> errorMessage;
  final Value<DateTime> sentAt;
  final Value<int> rowid;
  const RequestHistoryCompanion({
    this.id = const Value.absent(),
    this.savedRequestId = const Value.absent(),
    this.method = const Value.absent(),
    this.url = const Value.absent(),
    this.rawUrl = const Value.absent(),
    this.resolvedUrl = const Value.absent(),
    this.environmentId = const Value.absent(),
    this.environmentName = const Value.absent(),
    this.requestHeadersJson = const Value.absent(),
    this.requestBodyType = const Value.absent(),
    this.requestBodyText = const Value.absent(),
    this.statusCode = const Value.absent(),
    this.statusMessage = const Value.absent(),
    this.responseHeadersJson = const Value.absent(),
    this.responseBodyText = const Value.absent(),
    this.responseBodyTruncated = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.contentType = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RequestHistoryCompanion.insert({
    required String id,
    this.savedRequestId = const Value.absent(),
    required String method,
    required String url,
    this.rawUrl = const Value.absent(),
    this.resolvedUrl = const Value.absent(),
    this.environmentId = const Value.absent(),
    this.environmentName = const Value.absent(),
    this.requestHeadersJson = const Value.absent(),
    required String requestBodyType,
    this.requestBodyText = const Value.absent(),
    this.statusCode = const Value.absent(),
    this.statusMessage = const Value.absent(),
    this.responseHeadersJson = const Value.absent(),
    this.responseBodyText = const Value.absent(),
    this.responseBodyTruncated = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.contentType = const Value.absent(),
    this.errorMessage = const Value.absent(),
    required DateTime sentAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       method = Value(method),
       url = Value(url),
       requestBodyType = Value(requestBodyType),
       sentAt = Value(sentAt);
  static Insertable<RequestHistoryData> custom({
    Expression<String>? id,
    Expression<String>? savedRequestId,
    Expression<String>? method,
    Expression<String>? url,
    Expression<String>? rawUrl,
    Expression<String>? resolvedUrl,
    Expression<String>? environmentId,
    Expression<String>? environmentName,
    Expression<String>? requestHeadersJson,
    Expression<String>? requestBodyType,
    Expression<String>? requestBodyText,
    Expression<int>? statusCode,
    Expression<String>? statusMessage,
    Expression<String>? responseHeadersJson,
    Expression<String>? responseBodyText,
    Expression<bool>? responseBodyTruncated,
    Expression<int>? durationMs,
    Expression<int>? sizeBytes,
    Expression<String>? contentType,
    Expression<String>? errorMessage,
    Expression<DateTime>? sentAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (savedRequestId != null) 'saved_request_id': savedRequestId,
      if (method != null) 'method': method,
      if (url != null) 'url': url,
      if (rawUrl != null) 'raw_url': rawUrl,
      if (resolvedUrl != null) 'resolved_url': resolvedUrl,
      if (environmentId != null) 'environment_id': environmentId,
      if (environmentName != null) 'environment_name': environmentName,
      if (requestHeadersJson != null)
        'request_headers_json': requestHeadersJson,
      if (requestBodyType != null) 'request_body_type': requestBodyType,
      if (requestBodyText != null) 'request_body_text': requestBodyText,
      if (statusCode != null) 'status_code': statusCode,
      if (statusMessage != null) 'status_message': statusMessage,
      if (responseHeadersJson != null)
        'response_headers_json': responseHeadersJson,
      if (responseBodyText != null) 'response_body_text': responseBodyText,
      if (responseBodyTruncated != null)
        'response_body_truncated': responseBodyTruncated,
      if (durationMs != null) 'duration_ms': durationMs,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (contentType != null) 'content_type': contentType,
      if (errorMessage != null) 'error_message': errorMessage,
      if (sentAt != null) 'sent_at': sentAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RequestHistoryCompanion copyWith({
    Value<String>? id,
    Value<String?>? savedRequestId,
    Value<String>? method,
    Value<String>? url,
    Value<String?>? rawUrl,
    Value<String?>? resolvedUrl,
    Value<String?>? environmentId,
    Value<String?>? environmentName,
    Value<String>? requestHeadersJson,
    Value<String>? requestBodyType,
    Value<String>? requestBodyText,
    Value<int?>? statusCode,
    Value<String?>? statusMessage,
    Value<String>? responseHeadersJson,
    Value<String>? responseBodyText,
    Value<bool>? responseBodyTruncated,
    Value<int>? durationMs,
    Value<int>? sizeBytes,
    Value<String?>? contentType,
    Value<String?>? errorMessage,
    Value<DateTime>? sentAt,
    Value<int>? rowid,
  }) {
    return RequestHistoryCompanion(
      id: id ?? this.id,
      savedRequestId: savedRequestId ?? this.savedRequestId,
      method: method ?? this.method,
      url: url ?? this.url,
      rawUrl: rawUrl ?? this.rawUrl,
      resolvedUrl: resolvedUrl ?? this.resolvedUrl,
      environmentId: environmentId ?? this.environmentId,
      environmentName: environmentName ?? this.environmentName,
      requestHeadersJson: requestHeadersJson ?? this.requestHeadersJson,
      requestBodyType: requestBodyType ?? this.requestBodyType,
      requestBodyText: requestBodyText ?? this.requestBodyText,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      responseHeadersJson: responseHeadersJson ?? this.responseHeadersJson,
      responseBodyText: responseBodyText ?? this.responseBodyText,
      responseBodyTruncated:
          responseBodyTruncated ?? this.responseBodyTruncated,
      durationMs: durationMs ?? this.durationMs,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      contentType: contentType ?? this.contentType,
      errorMessage: errorMessage ?? this.errorMessage,
      sentAt: sentAt ?? this.sentAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (savedRequestId.present) {
      map['saved_request_id'] = Variable<String>(savedRequestId.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rawUrl.present) {
      map['raw_url'] = Variable<String>(rawUrl.value);
    }
    if (resolvedUrl.present) {
      map['resolved_url'] = Variable<String>(resolvedUrl.value);
    }
    if (environmentId.present) {
      map['environment_id'] = Variable<String>(environmentId.value);
    }
    if (environmentName.present) {
      map['environment_name'] = Variable<String>(environmentName.value);
    }
    if (requestHeadersJson.present) {
      map['request_headers_json'] = Variable<String>(requestHeadersJson.value);
    }
    if (requestBodyType.present) {
      map['request_body_type'] = Variable<String>(requestBodyType.value);
    }
    if (requestBodyText.present) {
      map['request_body_text'] = Variable<String>(requestBodyText.value);
    }
    if (statusCode.present) {
      map['status_code'] = Variable<int>(statusCode.value);
    }
    if (statusMessage.present) {
      map['status_message'] = Variable<String>(statusMessage.value);
    }
    if (responseHeadersJson.present) {
      map['response_headers_json'] = Variable<String>(
        responseHeadersJson.value,
      );
    }
    if (responseBodyText.present) {
      map['response_body_text'] = Variable<String>(responseBodyText.value);
    }
    if (responseBodyTruncated.present) {
      map['response_body_truncated'] = Variable<bool>(
        responseBodyTruncated.value,
      );
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestHistoryCompanion(')
          ..write('id: $id, ')
          ..write('savedRequestId: $savedRequestId, ')
          ..write('method: $method, ')
          ..write('url: $url, ')
          ..write('rawUrl: $rawUrl, ')
          ..write('resolvedUrl: $resolvedUrl, ')
          ..write('environmentId: $environmentId, ')
          ..write('environmentName: $environmentName, ')
          ..write('requestHeadersJson: $requestHeadersJson, ')
          ..write('requestBodyType: $requestBodyType, ')
          ..write('requestBodyText: $requestBodyText, ')
          ..write('statusCode: $statusCode, ')
          ..write('statusMessage: $statusMessage, ')
          ..write('responseHeadersJson: $responseHeadersJson, ')
          ..write('responseBodyText: $responseBodyText, ')
          ..write('responseBodyTruncated: $responseBodyTruncated, ')
          ..write('durationMs: $durationMs, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('contentType: $contentType, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('sentAt: $sentAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnvironmentsTable extends Environments
    with TableInfo<$EnvironmentsTable, Environment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnvironmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    isActive,
    createdAt,
    updatedAt,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Environment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Environment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Environment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $EnvironmentsTable createAlias(String alias) {
    return $EnvironmentsTable(attachedDatabase, alias);
  }
}

class Environment extends DataClass implements Insertable<Environment> {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sortOrder;
  const Environment({
    required this.id,
    required this.name,
    this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  EnvironmentsCompanion toCompanion(bool nullToAbsent) {
    return EnvironmentsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      sortOrder: Value(sortOrder),
    );
  }

  factory Environment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Environment(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  Environment copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? sortOrder,
  }) => Environment(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  Environment copyWithCompanion(EnvironmentsCompanion data) {
    return Environment(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Environment(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    isActive,
    createdAt,
    updatedAt,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Environment &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.sortOrder == this.sortOrder);
}

class EnvironmentsCompanion extends UpdateCompanion<Environment> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const EnvironmentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnvironmentsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Environment> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnvironmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return EnvironmentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnvironmentVariablesTable extends EnvironmentVariables
    with TableInfo<$EnvironmentVariablesTable, EnvironmentVariable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnvironmentVariablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _environmentIdMeta = const VerificationMeta(
    'environmentId',
  );
  @override
  late final GeneratedColumn<String> environmentId = GeneratedColumn<String>(
    'environment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isSecretMeta = const VerificationMeta(
    'isSecret',
  );
  @override
  late final GeneratedColumn<bool> isSecret = GeneratedColumn<bool>(
    'is_secret',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_secret" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    environmentId,
    key,
    value,
    isSecret,
    isEnabled,
    createdAt,
    updatedAt,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environment_variables';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnvironmentVariable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('environment_id')) {
      context.handle(
        _environmentIdMeta,
        environmentId.isAcceptableOrUnknown(
          data['environment_id']!,
          _environmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_environmentIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('is_secret')) {
      context.handle(
        _isSecretMeta,
        isSecret.isAcceptableOrUnknown(data['is_secret']!, _isSecretMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EnvironmentVariable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnvironmentVariable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      environmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}environment_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      isSecret: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_secret'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $EnvironmentVariablesTable createAlias(String alias) {
    return $EnvironmentVariablesTable(attachedDatabase, alias);
  }
}

class EnvironmentVariable extends DataClass
    implements Insertable<EnvironmentVariable> {
  final String id;
  final String environmentId;
  final String key;
  final String value;
  final bool isSecret;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sortOrder;
  const EnvironmentVariable({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['environment_id'] = Variable<String>(environmentId);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['is_secret'] = Variable<bool>(isSecret);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  EnvironmentVariablesCompanion toCompanion(bool nullToAbsent) {
    return EnvironmentVariablesCompanion(
      id: Value(id),
      environmentId: Value(environmentId),
      key: Value(key),
      value: Value(value),
      isSecret: Value(isSecret),
      isEnabled: Value(isEnabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      sortOrder: Value(sortOrder),
    );
  }

  factory EnvironmentVariable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnvironmentVariable(
      id: serializer.fromJson<String>(json['id']),
      environmentId: serializer.fromJson<String>(json['environmentId']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      isSecret: serializer.fromJson<bool>(json['isSecret']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'environmentId': serializer.toJson<String>(environmentId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'isSecret': serializer.toJson<bool>(isSecret),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  EnvironmentVariable copyWith({
    String? id,
    String? environmentId,
    String? key,
    String? value,
    bool? isSecret,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? sortOrder,
  }) => EnvironmentVariable(
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
  EnvironmentVariable copyWithCompanion(EnvironmentVariablesCompanion data) {
    return EnvironmentVariable(
      id: data.id.present ? data.id.value : this.id,
      environmentId: data.environmentId.present
          ? data.environmentId.value
          : this.environmentId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      isSecret: data.isSecret.present ? data.isSecret.value : this.isSecret,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentVariable(')
          ..write('id: $id, ')
          ..write('environmentId: $environmentId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('isSecret: $isSecret, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    environmentId,
    key,
    value,
    isSecret,
    isEnabled,
    createdAt,
    updatedAt,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnvironmentVariable &&
          other.id == this.id &&
          other.environmentId == this.environmentId &&
          other.key == this.key &&
          other.value == this.value &&
          other.isSecret == this.isSecret &&
          other.isEnabled == this.isEnabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.sortOrder == this.sortOrder);
}

class EnvironmentVariablesCompanion
    extends UpdateCompanion<EnvironmentVariable> {
  final Value<String> id;
  final Value<String> environmentId;
  final Value<String> key;
  final Value<String> value;
  final Value<bool> isSecret;
  final Value<bool> isEnabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const EnvironmentVariablesCompanion({
    this.id = const Value.absent(),
    this.environmentId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.isSecret = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnvironmentVariablesCompanion.insert({
    required String id,
    required String environmentId,
    required String key,
    this.value = const Value.absent(),
    this.isSecret = const Value.absent(),
    this.isEnabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       environmentId = Value(environmentId),
       key = Value(key),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<EnvironmentVariable> custom({
    Expression<String>? id,
    Expression<String>? environmentId,
    Expression<String>? key,
    Expression<String>? value,
    Expression<bool>? isSecret,
    Expression<bool>? isEnabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (environmentId != null) 'environment_id': environmentId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (isSecret != null) 'is_secret': isSecret,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnvironmentVariablesCompanion copyWith({
    Value<String>? id,
    Value<String>? environmentId,
    Value<String>? key,
    Value<String>? value,
    Value<bool>? isSecret,
    Value<bool>? isEnabled,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return EnvironmentVariablesCompanion(
      id: id ?? this.id,
      environmentId: environmentId ?? this.environmentId,
      key: key ?? this.key,
      value: value ?? this.value,
      isSecret: isSecret ?? this.isSecret,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (environmentId.present) {
      map['environment_id'] = Variable<String>(environmentId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (isSecret.present) {
      map['is_secret'] = Variable<bool>(isSecret.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentVariablesCompanion(')
          ..write('id: $id, ')
          ..write('environmentId: $environmentId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('isSecret: $isSecret, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $SavedRequestsTable savedRequests = $SavedRequestsTable(this);
  late final $RequestHistoryTable requestHistory = $RequestHistoryTable(this);
  late final $EnvironmentsTable environments = $EnvironmentsTable(this);
  late final $EnvironmentVariablesTable environmentVariables =
      $EnvironmentVariablesTable(this);
  late final CollectionsDao collectionsDao = CollectionsDao(
    this as AppDatabase,
  );
  late final SavedRequestsDao savedRequestsDao = SavedRequestsDao(
    this as AppDatabase,
  );
  late final RequestHistoryDao requestHistoryDao = RequestHistoryDao(
    this as AppDatabase,
  );
  late final EnvironmentsDao environmentsDao = EnvironmentsDao(
    this as AppDatabase,
  );
  late final EnvironmentVariablesDao environmentVariablesDao =
      EnvironmentVariablesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    collections,
    savedRequests,
    requestHistory,
    environments,
    environmentVariables,
  ];
}

typedef $$CollectionsTableCreateCompanionBuilder =
    CollectionsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String> colorLabel,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$CollectionsTableUpdateCompanionBuilder =
    CollectionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> colorLabel,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });

class $$CollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorLabel => $composableBuilder(
    column: $table.colorLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorLabel => $composableBuilder(
    column: $table.colorLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorLabel => $composableBuilder(
    column: $table.colorLabel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$CollectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionsTable,
          Collection,
          $$CollectionsTableFilterComposer,
          $$CollectionsTableOrderingComposer,
          $$CollectionsTableAnnotationComposer,
          $$CollectionsTableCreateCompanionBuilder,
          $$CollectionsTableUpdateCompanionBuilder,
          (
            Collection,
            BaseReferences<_$AppDatabase, $CollectionsTable, Collection>,
          ),
          Collection,
          PrefetchHooks Function()
        > {
  $$CollectionsTableTableManager(_$AppDatabase db, $CollectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> colorLabel = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionsCompanion(
                id: id,
                name: name,
                description: description,
                colorLabel: colorLabel,
                createdAt: createdAt,
                updatedAt: updatedAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String> colorLabel = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionsCompanion.insert(
                id: id,
                name: name,
                description: description,
                colorLabel: colorLabel,
                createdAt: createdAt,
                updatedAt: updatedAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionsTable,
      Collection,
      $$CollectionsTableFilterComposer,
      $$CollectionsTableOrderingComposer,
      $$CollectionsTableAnnotationComposer,
      $$CollectionsTableCreateCompanionBuilder,
      $$CollectionsTableUpdateCompanionBuilder,
      (
        Collection,
        BaseReferences<_$AppDatabase, $CollectionsTable, Collection>,
      ),
      Collection,
      PrefetchHooks Function()
    >;
typedef $$SavedRequestsTableCreateCompanionBuilder =
    SavedRequestsCompanion Function({
      required String id,
      Value<String?> collectionId,
      required String name,
      required String method,
      required String url,
      Value<String> queryParamsJson,
      Value<String> headersJson,
      Value<String> authJson,
      required String bodyType,
      Value<String> bodyJson,
      Value<String> bodyText,
      Value<int> timeoutSeconds,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> lastSentAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$SavedRequestsTableUpdateCompanionBuilder =
    SavedRequestsCompanion Function({
      Value<String> id,
      Value<String?> collectionId,
      Value<String> name,
      Value<String> method,
      Value<String> url,
      Value<String> queryParamsJson,
      Value<String> headersJson,
      Value<String> authJson,
      Value<String> bodyType,
      Value<String> bodyJson,
      Value<String> bodyText,
      Value<int> timeoutSeconds,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> lastSentAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });

class $$SavedRequestsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedRequestsTable> {
  $$SavedRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get collectionId => $composableBuilder(
    column: $table.collectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get queryParamsJson => $composableBuilder(
    column: $table.queryParamsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headersJson => $composableBuilder(
    column: $table.headersJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authJson => $composableBuilder(
    column: $table.authJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyType => $composableBuilder(
    column: $table.bodyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyJson => $composableBuilder(
    column: $table.bodyJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyText => $composableBuilder(
    column: $table.bodyText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeoutSeconds => $composableBuilder(
    column: $table.timeoutSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSentAt => $composableBuilder(
    column: $table.lastSentAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavedRequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedRequestsTable> {
  $$SavedRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get collectionId => $composableBuilder(
    column: $table.collectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get queryParamsJson => $composableBuilder(
    column: $table.queryParamsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headersJson => $composableBuilder(
    column: $table.headersJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authJson => $composableBuilder(
    column: $table.authJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyType => $composableBuilder(
    column: $table.bodyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyJson => $composableBuilder(
    column: $table.bodyJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyText => $composableBuilder(
    column: $table.bodyText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeoutSeconds => $composableBuilder(
    column: $table.timeoutSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSentAt => $composableBuilder(
    column: $table.lastSentAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavedRequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedRequestsTable> {
  $$SavedRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get collectionId => $composableBuilder(
    column: $table.collectionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get queryParamsJson => $composableBuilder(
    column: $table.queryParamsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get headersJson => $composableBuilder(
    column: $table.headersJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get authJson =>
      $composableBuilder(column: $table.authJson, builder: (column) => column);

  GeneratedColumn<String> get bodyType =>
      $composableBuilder(column: $table.bodyType, builder: (column) => column);

  GeneratedColumn<String> get bodyJson =>
      $composableBuilder(column: $table.bodyJson, builder: (column) => column);

  GeneratedColumn<String> get bodyText =>
      $composableBuilder(column: $table.bodyText, builder: (column) => column);

  GeneratedColumn<int> get timeoutSeconds => $composableBuilder(
    column: $table.timeoutSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSentAt => $composableBuilder(
    column: $table.lastSentAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$SavedRequestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedRequestsTable,
          SavedRequest,
          $$SavedRequestsTableFilterComposer,
          $$SavedRequestsTableOrderingComposer,
          $$SavedRequestsTableAnnotationComposer,
          $$SavedRequestsTableCreateCompanionBuilder,
          $$SavedRequestsTableUpdateCompanionBuilder,
          (
            SavedRequest,
            BaseReferences<_$AppDatabase, $SavedRequestsTable, SavedRequest>,
          ),
          SavedRequest,
          PrefetchHooks Function()
        > {
  $$SavedRequestsTableTableManager(_$AppDatabase db, $SavedRequestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> collectionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> queryParamsJson = const Value.absent(),
                Value<String> headersJson = const Value.absent(),
                Value<String> authJson = const Value.absent(),
                Value<String> bodyType = const Value.absent(),
                Value<String> bodyJson = const Value.absent(),
                Value<String> bodyText = const Value.absent(),
                Value<int> timeoutSeconds = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> lastSentAt = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavedRequestsCompanion(
                id: id,
                collectionId: collectionId,
                name: name,
                method: method,
                url: url,
                queryParamsJson: queryParamsJson,
                headersJson: headersJson,
                authJson: authJson,
                bodyType: bodyType,
                bodyJson: bodyJson,
                bodyText: bodyText,
                timeoutSeconds: timeoutSeconds,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastSentAt: lastSentAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> collectionId = const Value.absent(),
                required String name,
                required String method,
                required String url,
                Value<String> queryParamsJson = const Value.absent(),
                Value<String> headersJson = const Value.absent(),
                Value<String> authJson = const Value.absent(),
                required String bodyType,
                Value<String> bodyJson = const Value.absent(),
                Value<String> bodyText = const Value.absent(),
                Value<int> timeoutSeconds = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> lastSentAt = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavedRequestsCompanion.insert(
                id: id,
                collectionId: collectionId,
                name: name,
                method: method,
                url: url,
                queryParamsJson: queryParamsJson,
                headersJson: headersJson,
                authJson: authJson,
                bodyType: bodyType,
                bodyJson: bodyJson,
                bodyText: bodyText,
                timeoutSeconds: timeoutSeconds,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastSentAt: lastSentAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavedRequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedRequestsTable,
      SavedRequest,
      $$SavedRequestsTableFilterComposer,
      $$SavedRequestsTableOrderingComposer,
      $$SavedRequestsTableAnnotationComposer,
      $$SavedRequestsTableCreateCompanionBuilder,
      $$SavedRequestsTableUpdateCompanionBuilder,
      (
        SavedRequest,
        BaseReferences<_$AppDatabase, $SavedRequestsTable, SavedRequest>,
      ),
      SavedRequest,
      PrefetchHooks Function()
    >;
typedef $$RequestHistoryTableCreateCompanionBuilder =
    RequestHistoryCompanion Function({
      required String id,
      Value<String?> savedRequestId,
      required String method,
      required String url,
      Value<String?> rawUrl,
      Value<String?> resolvedUrl,
      Value<String?> environmentId,
      Value<String?> environmentName,
      Value<String> requestHeadersJson,
      required String requestBodyType,
      Value<String> requestBodyText,
      Value<int?> statusCode,
      Value<String?> statusMessage,
      Value<String> responseHeadersJson,
      Value<String> responseBodyText,
      Value<bool> responseBodyTruncated,
      Value<int> durationMs,
      Value<int> sizeBytes,
      Value<String?> contentType,
      Value<String?> errorMessage,
      required DateTime sentAt,
      Value<int> rowid,
    });
typedef $$RequestHistoryTableUpdateCompanionBuilder =
    RequestHistoryCompanion Function({
      Value<String> id,
      Value<String?> savedRequestId,
      Value<String> method,
      Value<String> url,
      Value<String?> rawUrl,
      Value<String?> resolvedUrl,
      Value<String?> environmentId,
      Value<String?> environmentName,
      Value<String> requestHeadersJson,
      Value<String> requestBodyType,
      Value<String> requestBodyText,
      Value<int?> statusCode,
      Value<String?> statusMessage,
      Value<String> responseHeadersJson,
      Value<String> responseBodyText,
      Value<bool> responseBodyTruncated,
      Value<int> durationMs,
      Value<int> sizeBytes,
      Value<String?> contentType,
      Value<String?> errorMessage,
      Value<DateTime> sentAt,
      Value<int> rowid,
    });

class $$RequestHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $RequestHistoryTable> {
  $$RequestHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get savedRequestId => $composableBuilder(
    column: $table.savedRequestId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawUrl => $composableBuilder(
    column: $table.rawUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resolvedUrl => $composableBuilder(
    column: $table.resolvedUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get environmentName => $composableBuilder(
    column: $table.environmentName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestHeadersJson => $composableBuilder(
    column: $table.requestHeadersJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestBodyType => $composableBuilder(
    column: $table.requestBodyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestBodyText => $composableBuilder(
    column: $table.requestBodyText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusMessage => $composableBuilder(
    column: $table.statusMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseHeadersJson => $composableBuilder(
    column: $table.responseHeadersJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseBodyText => $composableBuilder(
    column: $table.responseBodyText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get responseBodyTruncated => $composableBuilder(
    column: $table.responseBodyTruncated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RequestHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $RequestHistoryTable> {
  $$RequestHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get savedRequestId => $composableBuilder(
    column: $table.savedRequestId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawUrl => $composableBuilder(
    column: $table.rawUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resolvedUrl => $composableBuilder(
    column: $table.resolvedUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get environmentName => $composableBuilder(
    column: $table.environmentName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestHeadersJson => $composableBuilder(
    column: $table.requestHeadersJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestBodyType => $composableBuilder(
    column: $table.requestBodyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestBodyText => $composableBuilder(
    column: $table.requestBodyText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusMessage => $composableBuilder(
    column: $table.statusMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseHeadersJson => $composableBuilder(
    column: $table.responseHeadersJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseBodyText => $composableBuilder(
    column: $table.responseBodyText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get responseBodyTruncated => $composableBuilder(
    column: $table.responseBodyTruncated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RequestHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequestHistoryTable> {
  $$RequestHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get savedRequestId => $composableBuilder(
    column: $table.savedRequestId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get rawUrl =>
      $composableBuilder(column: $table.rawUrl, builder: (column) => column);

  GeneratedColumn<String> get resolvedUrl => $composableBuilder(
    column: $table.resolvedUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get environmentName => $composableBuilder(
    column: $table.environmentName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestHeadersJson => $composableBuilder(
    column: $table.requestHeadersJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestBodyType => $composableBuilder(
    column: $table.requestBodyType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestBodyText => $composableBuilder(
    column: $table.requestBodyText,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusMessage => $composableBuilder(
    column: $table.statusMessage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get responseHeadersJson => $composableBuilder(
    column: $table.responseHeadersJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get responseBodyText => $composableBuilder(
    column: $table.responseBodyText,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get responseBodyTruncated => $composableBuilder(
    column: $table.responseBodyTruncated,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sentAt =>
      $composableBuilder(column: $table.sentAt, builder: (column) => column);
}

class $$RequestHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequestHistoryTable,
          RequestHistoryData,
          $$RequestHistoryTableFilterComposer,
          $$RequestHistoryTableOrderingComposer,
          $$RequestHistoryTableAnnotationComposer,
          $$RequestHistoryTableCreateCompanionBuilder,
          $$RequestHistoryTableUpdateCompanionBuilder,
          (
            RequestHistoryData,
            BaseReferences<
              _$AppDatabase,
              $RequestHistoryTable,
              RequestHistoryData
            >,
          ),
          RequestHistoryData,
          PrefetchHooks Function()
        > {
  $$RequestHistoryTableTableManager(
    _$AppDatabase db,
    $RequestHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequestHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequestHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> savedRequestId = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> rawUrl = const Value.absent(),
                Value<String?> resolvedUrl = const Value.absent(),
                Value<String?> environmentId = const Value.absent(),
                Value<String?> environmentName = const Value.absent(),
                Value<String> requestHeadersJson = const Value.absent(),
                Value<String> requestBodyType = const Value.absent(),
                Value<String> requestBodyText = const Value.absent(),
                Value<int?> statusCode = const Value.absent(),
                Value<String?> statusMessage = const Value.absent(),
                Value<String> responseHeadersJson = const Value.absent(),
                Value<String> responseBodyText = const Value.absent(),
                Value<bool> responseBodyTruncated = const Value.absent(),
                Value<int> durationMs = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime> sentAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RequestHistoryCompanion(
                id: id,
                savedRequestId: savedRequestId,
                method: method,
                url: url,
                rawUrl: rawUrl,
                resolvedUrl: resolvedUrl,
                environmentId: environmentId,
                environmentName: environmentName,
                requestHeadersJson: requestHeadersJson,
                requestBodyType: requestBodyType,
                requestBodyText: requestBodyText,
                statusCode: statusCode,
                statusMessage: statusMessage,
                responseHeadersJson: responseHeadersJson,
                responseBodyText: responseBodyText,
                responseBodyTruncated: responseBodyTruncated,
                durationMs: durationMs,
                sizeBytes: sizeBytes,
                contentType: contentType,
                errorMessage: errorMessage,
                sentAt: sentAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> savedRequestId = const Value.absent(),
                required String method,
                required String url,
                Value<String?> rawUrl = const Value.absent(),
                Value<String?> resolvedUrl = const Value.absent(),
                Value<String?> environmentId = const Value.absent(),
                Value<String?> environmentName = const Value.absent(),
                Value<String> requestHeadersJson = const Value.absent(),
                required String requestBodyType,
                Value<String> requestBodyText = const Value.absent(),
                Value<int?> statusCode = const Value.absent(),
                Value<String?> statusMessage = const Value.absent(),
                Value<String> responseHeadersJson = const Value.absent(),
                Value<String> responseBodyText = const Value.absent(),
                Value<bool> responseBodyTruncated = const Value.absent(),
                Value<int> durationMs = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                required DateTime sentAt,
                Value<int> rowid = const Value.absent(),
              }) => RequestHistoryCompanion.insert(
                id: id,
                savedRequestId: savedRequestId,
                method: method,
                url: url,
                rawUrl: rawUrl,
                resolvedUrl: resolvedUrl,
                environmentId: environmentId,
                environmentName: environmentName,
                requestHeadersJson: requestHeadersJson,
                requestBodyType: requestBodyType,
                requestBodyText: requestBodyText,
                statusCode: statusCode,
                statusMessage: statusMessage,
                responseHeadersJson: responseHeadersJson,
                responseBodyText: responseBodyText,
                responseBodyTruncated: responseBodyTruncated,
                durationMs: durationMs,
                sizeBytes: sizeBytes,
                contentType: contentType,
                errorMessage: errorMessage,
                sentAt: sentAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RequestHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequestHistoryTable,
      RequestHistoryData,
      $$RequestHistoryTableFilterComposer,
      $$RequestHistoryTableOrderingComposer,
      $$RequestHistoryTableAnnotationComposer,
      $$RequestHistoryTableCreateCompanionBuilder,
      $$RequestHistoryTableUpdateCompanionBuilder,
      (
        RequestHistoryData,
        BaseReferences<_$AppDatabase, $RequestHistoryTable, RequestHistoryData>,
      ),
      RequestHistoryData,
      PrefetchHooks Function()
    >;
typedef $$EnvironmentsTableCreateCompanionBuilder =
    EnvironmentsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$EnvironmentsTableUpdateCompanionBuilder =
    EnvironmentsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });

class $$EnvironmentsTableFilterComposer
    extends Composer<_$AppDatabase, $EnvironmentsTable> {
  $$EnvironmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnvironmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $EnvironmentsTable> {
  $$EnvironmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnvironmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnvironmentsTable> {
  $$EnvironmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$EnvironmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnvironmentsTable,
          Environment,
          $$EnvironmentsTableFilterComposer,
          $$EnvironmentsTableOrderingComposer,
          $$EnvironmentsTableAnnotationComposer,
          $$EnvironmentsTableCreateCompanionBuilder,
          $$EnvironmentsTableUpdateCompanionBuilder,
          (
            Environment,
            BaseReferences<_$AppDatabase, $EnvironmentsTable, Environment>,
          ),
          Environment,
          PrefetchHooks Function()
        > {
  $$EnvironmentsTableTableManager(_$AppDatabase db, $EnvironmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnvironmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnvironmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnvironmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnvironmentsCompanion(
                id: id,
                name: name,
                description: description,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnvironmentsCompanion.insert(
                id: id,
                name: name,
                description: description,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnvironmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnvironmentsTable,
      Environment,
      $$EnvironmentsTableFilterComposer,
      $$EnvironmentsTableOrderingComposer,
      $$EnvironmentsTableAnnotationComposer,
      $$EnvironmentsTableCreateCompanionBuilder,
      $$EnvironmentsTableUpdateCompanionBuilder,
      (
        Environment,
        BaseReferences<_$AppDatabase, $EnvironmentsTable, Environment>,
      ),
      Environment,
      PrefetchHooks Function()
    >;
typedef $$EnvironmentVariablesTableCreateCompanionBuilder =
    EnvironmentVariablesCompanion Function({
      required String id,
      required String environmentId,
      required String key,
      Value<String> value,
      Value<bool> isSecret,
      Value<bool> isEnabled,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$EnvironmentVariablesTableUpdateCompanionBuilder =
    EnvironmentVariablesCompanion Function({
      Value<String> id,
      Value<String> environmentId,
      Value<String> key,
      Value<String> value,
      Value<bool> isSecret,
      Value<bool> isEnabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> sortOrder,
      Value<int> rowid,
    });

class $$EnvironmentVariablesTableFilterComposer
    extends Composer<_$AppDatabase, $EnvironmentVariablesTable> {
  $$EnvironmentVariablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSecret => $composableBuilder(
    column: $table.isSecret,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnvironmentVariablesTableOrderingComposer
    extends Composer<_$AppDatabase, $EnvironmentVariablesTable> {
  $$EnvironmentVariablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSecret => $composableBuilder(
    column: $table.isSecret,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnvironmentVariablesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnvironmentVariablesTable> {
  $$EnvironmentVariablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<bool> get isSecret =>
      $composableBuilder(column: $table.isSecret, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$EnvironmentVariablesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnvironmentVariablesTable,
          EnvironmentVariable,
          $$EnvironmentVariablesTableFilterComposer,
          $$EnvironmentVariablesTableOrderingComposer,
          $$EnvironmentVariablesTableAnnotationComposer,
          $$EnvironmentVariablesTableCreateCompanionBuilder,
          $$EnvironmentVariablesTableUpdateCompanionBuilder,
          (
            EnvironmentVariable,
            BaseReferences<
              _$AppDatabase,
              $EnvironmentVariablesTable,
              EnvironmentVariable
            >,
          ),
          EnvironmentVariable,
          PrefetchHooks Function()
        > {
  $$EnvironmentVariablesTableTableManager(
    _$AppDatabase db,
    $EnvironmentVariablesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnvironmentVariablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnvironmentVariablesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EnvironmentVariablesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> environmentId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<bool> isSecret = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnvironmentVariablesCompanion(
                id: id,
                environmentId: environmentId,
                key: key,
                value: value,
                isSecret: isSecret,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String environmentId,
                required String key,
                Value<String> value = const Value.absent(),
                Value<bool> isSecret = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnvironmentVariablesCompanion.insert(
                id: id,
                environmentId: environmentId,
                key: key,
                value: value,
                isSecret: isSecret,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnvironmentVariablesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnvironmentVariablesTable,
      EnvironmentVariable,
      $$EnvironmentVariablesTableFilterComposer,
      $$EnvironmentVariablesTableOrderingComposer,
      $$EnvironmentVariablesTableAnnotationComposer,
      $$EnvironmentVariablesTableCreateCompanionBuilder,
      $$EnvironmentVariablesTableUpdateCompanionBuilder,
      (
        EnvironmentVariable,
        BaseReferences<
          _$AppDatabase,
          $EnvironmentVariablesTable,
          EnvironmentVariable
        >,
      ),
      EnvironmentVariable,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$SavedRequestsTableTableManager get savedRequests =>
      $$SavedRequestsTableTableManager(_db, _db.savedRequests);
  $$RequestHistoryTableTableManager get requestHistory =>
      $$RequestHistoryTableTableManager(_db, _db.requestHistory);
  $$EnvironmentsTableTableManager get environments =>
      $$EnvironmentsTableTableManager(_db, _db.environments);
  $$EnvironmentVariablesTableTableManager get environmentVariables =>
      $$EnvironmentVariablesTableTableManager(_db, _db.environmentVariables);
}

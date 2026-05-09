// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StorageSourcesTable extends StorageSources
    with TableInfo<$StorageSourcesTable, StorageSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _mountPathMeta = const VerificationMeta(
    'mountPath',
  );
  @override
  late final GeneratedColumn<String> mountPath = GeneratedColumn<String>(
    'mount_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('外部存储'),
  );
  static const VerificationMeta _lastScannedMeta = const VerificationMeta(
    'lastScanned',
  );
  @override
  late final GeneratedColumn<DateTime> lastScanned = GeneratedColumn<DateTime>(
    'last_scanned',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isOfflineMeta = const VerificationMeta(
    'isOffline',
  );
  @override
  late final GeneratedColumn<bool> isOffline = GeneratedColumn<bool>(
    'is_offline',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_offline" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mountPath,
    label,
    lastScanned,
    isOffline,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<StorageSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mount_path')) {
      context.handle(
        _mountPathMeta,
        mountPath.isAcceptableOrUnknown(data['mount_path']!, _mountPathMeta),
      );
    } else if (isInserting) {
      context.missing(_mountPathMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('last_scanned')) {
      context.handle(
        _lastScannedMeta,
        lastScanned.isAcceptableOrUnknown(
          data['last_scanned']!,
          _lastScannedMeta,
        ),
      );
    }
    if (data.containsKey('is_offline')) {
      context.handle(
        _isOfflineMeta,
        isOffline.isAcceptableOrUnknown(data['is_offline']!, _isOfflineMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageSource(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      mountPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mount_path'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      lastScanned: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_scanned'],
      ),
      isOffline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_offline'],
      )!,
    );
  }

  @override
  $StorageSourcesTable createAlias(String alias) {
    return $StorageSourcesTable(attachedDatabase, alias);
  }
}

class StorageSource extends DataClass implements Insertable<StorageSource> {
  final int id;
  final String mountPath;
  final String label;
  final DateTime? lastScanned;
  final bool isOffline;
  const StorageSource({
    required this.id,
    required this.mountPath,
    required this.label,
    this.lastScanned,
    required this.isOffline,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mount_path'] = Variable<String>(mountPath);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || lastScanned != null) {
      map['last_scanned'] = Variable<DateTime>(lastScanned);
    }
    map['is_offline'] = Variable<bool>(isOffline);
    return map;
  }

  StorageSourcesCompanion toCompanion(bool nullToAbsent) {
    return StorageSourcesCompanion(
      id: Value(id),
      mountPath: Value(mountPath),
      label: Value(label),
      lastScanned: lastScanned == null && nullToAbsent
          ? const Value.absent()
          : Value(lastScanned),
      isOffline: Value(isOffline),
    );
  }

  factory StorageSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageSource(
      id: serializer.fromJson<int>(json['id']),
      mountPath: serializer.fromJson<String>(json['mountPath']),
      label: serializer.fromJson<String>(json['label']),
      lastScanned: serializer.fromJson<DateTime?>(json['lastScanned']),
      isOffline: serializer.fromJson<bool>(json['isOffline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mountPath': serializer.toJson<String>(mountPath),
      'label': serializer.toJson<String>(label),
      'lastScanned': serializer.toJson<DateTime?>(lastScanned),
      'isOffline': serializer.toJson<bool>(isOffline),
    };
  }

  StorageSource copyWith({
    int? id,
    String? mountPath,
    String? label,
    Value<DateTime?> lastScanned = const Value.absent(),
    bool? isOffline,
  }) => StorageSource(
    id: id ?? this.id,
    mountPath: mountPath ?? this.mountPath,
    label: label ?? this.label,
    lastScanned: lastScanned.present ? lastScanned.value : this.lastScanned,
    isOffline: isOffline ?? this.isOffline,
  );
  StorageSource copyWithCompanion(StorageSourcesCompanion data) {
    return StorageSource(
      id: data.id.present ? data.id.value : this.id,
      mountPath: data.mountPath.present ? data.mountPath.value : this.mountPath,
      label: data.label.present ? data.label.value : this.label,
      lastScanned: data.lastScanned.present
          ? data.lastScanned.value
          : this.lastScanned,
      isOffline: data.isOffline.present ? data.isOffline.value : this.isOffline,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageSource(')
          ..write('id: $id, ')
          ..write('mountPath: $mountPath, ')
          ..write('label: $label, ')
          ..write('lastScanned: $lastScanned, ')
          ..write('isOffline: $isOffline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mountPath, label, lastScanned, isOffline);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageSource &&
          other.id == this.id &&
          other.mountPath == this.mountPath &&
          other.label == this.label &&
          other.lastScanned == this.lastScanned &&
          other.isOffline == this.isOffline);
}

class StorageSourcesCompanion extends UpdateCompanion<StorageSource> {
  final Value<int> id;
  final Value<String> mountPath;
  final Value<String> label;
  final Value<DateTime?> lastScanned;
  final Value<bool> isOffline;
  const StorageSourcesCompanion({
    this.id = const Value.absent(),
    this.mountPath = const Value.absent(),
    this.label = const Value.absent(),
    this.lastScanned = const Value.absent(),
    this.isOffline = const Value.absent(),
  });
  StorageSourcesCompanion.insert({
    this.id = const Value.absent(),
    required String mountPath,
    this.label = const Value.absent(),
    this.lastScanned = const Value.absent(),
    this.isOffline = const Value.absent(),
  }) : mountPath = Value(mountPath);
  static Insertable<StorageSource> custom({
    Expression<int>? id,
    Expression<String>? mountPath,
    Expression<String>? label,
    Expression<DateTime>? lastScanned,
    Expression<bool>? isOffline,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mountPath != null) 'mount_path': mountPath,
      if (label != null) 'label': label,
      if (lastScanned != null) 'last_scanned': lastScanned,
      if (isOffline != null) 'is_offline': isOffline,
    });
  }

  StorageSourcesCompanion copyWith({
    Value<int>? id,
    Value<String>? mountPath,
    Value<String>? label,
    Value<DateTime?>? lastScanned,
    Value<bool>? isOffline,
  }) {
    return StorageSourcesCompanion(
      id: id ?? this.id,
      mountPath: mountPath ?? this.mountPath,
      label: label ?? this.label,
      lastScanned: lastScanned ?? this.lastScanned,
      isOffline: isOffline ?? this.isOffline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mountPath.present) {
      map['mount_path'] = Variable<String>(mountPath.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (lastScanned.present) {
      map['last_scanned'] = Variable<DateTime>(lastScanned.value);
    }
    if (isOffline.present) {
      map['is_offline'] = Variable<bool>(isOffline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageSourcesCompanion(')
          ..write('id: $id, ')
          ..write('mountPath: $mountPath, ')
          ..write('label: $label, ')
          ..write('lastScanned: $lastScanned, ')
          ..write('isOffline: $isOffline')
          ..write(')'))
        .toString();
  }
}

class $FoldersTable extends Folders with TableInfo<$FoldersTable, Folder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoldersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES storage_sources (id)',
    ),
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _coverPathMeta = const VerificationMeta(
    'coverPath',
  );
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
    'cover_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceId,
    path,
    name,
    coverPath,
    isFavorite,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'folders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Folder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover_path')) {
      context.handle(
        _coverPathMeta,
        coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Folder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Folder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      coverPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_path'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
    );
  }

  @override
  $FoldersTable createAlias(String alias) {
    return $FoldersTable(attachedDatabase, alias);
  }
}

class Folder extends DataClass implements Insertable<Folder> {
  final int id;
  final int sourceId;
  final String path;
  final String name;
  final String? coverPath;
  final bool isFavorite;
  const Folder({
    required this.id,
    required this.sourceId,
    required this.path,
    required this.name,
    this.coverPath,
    required this.isFavorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_id'] = Variable<int>(sourceId);
    map['path'] = Variable<String>(path);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  FoldersCompanion toCompanion(bool nullToAbsent) {
    return FoldersCompanion(
      id: Value(id),
      sourceId: Value(sourceId),
      path: Value(path),
      name: Value(name),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      isFavorite: Value(isFavorite),
    );
  }

  factory Folder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Folder(
      id: serializer.fromJson<int>(json['id']),
      sourceId: serializer.fromJson<int>(json['sourceId']),
      path: serializer.fromJson<String>(json['path']),
      name: serializer.fromJson<String>(json['name']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceId': serializer.toJson<int>(sourceId),
      'path': serializer.toJson<String>(path),
      'name': serializer.toJson<String>(name),
      'coverPath': serializer.toJson<String?>(coverPath),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  Folder copyWith({
    int? id,
    int? sourceId,
    String? path,
    String? name,
    Value<String?> coverPath = const Value.absent(),
    bool? isFavorite,
  }) => Folder(
    id: id ?? this.id,
    sourceId: sourceId ?? this.sourceId,
    path: path ?? this.path,
    name: name ?? this.name,
    coverPath: coverPath.present ? coverPath.value : this.coverPath,
    isFavorite: isFavorite ?? this.isFavorite,
  );
  Folder copyWithCompanion(FoldersCompanion data) {
    return Folder(
      id: data.id.present ? data.id.value : this.id,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      path: data.path.present ? data.path.value : this.path,
      name: data.name.present ? data.name.value : this.name,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Folder(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('path: $path, ')
          ..write('name: $name, ')
          ..write('coverPath: $coverPath, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sourceId, path, name, coverPath, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Folder &&
          other.id == this.id &&
          other.sourceId == this.sourceId &&
          other.path == this.path &&
          other.name == this.name &&
          other.coverPath == this.coverPath &&
          other.isFavorite == this.isFavorite);
}

class FoldersCompanion extends UpdateCompanion<Folder> {
  final Value<int> id;
  final Value<int> sourceId;
  final Value<String> path;
  final Value<String> name;
  final Value<String?> coverPath;
  final Value<bool> isFavorite;
  const FoldersCompanion({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.path = const Value.absent(),
    this.name = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  FoldersCompanion.insert({
    this.id = const Value.absent(),
    required int sourceId,
    required String path,
    required String name,
    this.coverPath = const Value.absent(),
    this.isFavorite = const Value.absent(),
  }) : sourceId = Value(sourceId),
       path = Value(path),
       name = Value(name);
  static Insertable<Folder> custom({
    Expression<int>? id,
    Expression<int>? sourceId,
    Expression<String>? path,
    Expression<String>? name,
    Expression<String>? coverPath,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceId != null) 'source_id': sourceId,
      if (path != null) 'path': path,
      if (name != null) 'name': name,
      if (coverPath != null) 'cover_path': coverPath,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  FoldersCompanion copyWith({
    Value<int>? id,
    Value<int>? sourceId,
    Value<String>? path,
    Value<String>? name,
    Value<String?>? coverPath,
    Value<bool>? isFavorite,
  }) {
    return FoldersCompanion(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      path: path ?? this.path,
      name: name ?? this.name,
      coverPath: coverPath ?? this.coverPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoldersCompanion(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('path: $path, ')
          ..write('name: $name, ')
          ..write('coverPath: $coverPath, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $VideosTable extends Videos with TableInfo<$VideosTable, Video> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _folderIdMeta = const VerificationMeta(
    'folderId',
  );
  @override
  late final GeneratedColumn<int> folderId = GeneratedColumn<int>(
    'folder_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES folders (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _extensionMeta = const VerificationMeta(
    'extension',
  );
  @override
  late final GeneratedColumn<String> extension = GeneratedColumn<String>(
    'extension',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPositionMeta = const VerificationMeta(
    'lastPosition',
  );
  @override
  late final GeneratedColumn<int> lastPosition = GeneratedColumn<int>(
    'last_position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPlayedAtMeta = const VerificationMeta(
    'lastPlayedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPlayedAt = GeneratedColumn<DateTime>(
    'last_played_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isWatchedMeta = const VerificationMeta(
    'isWatched',
  );
  @override
  late final GeneratedColumn<bool> isWatched = GeneratedColumn<bool>(
    'is_watched',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_watched" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _episodeNumberMeta = const VerificationMeta(
    'episodeNumber',
  );
  @override
  late final GeneratedColumn<int> episodeNumber = GeneratedColumn<int>(
    'episode_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resolutionMeta = const VerificationMeta(
    'resolution',
  );
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
    'resolution',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileSizeMeta = const VerificationMeta(
    'fileSize',
  );
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    folderId,
    title,
    path,
    extension,
    duration,
    lastPosition,
    lastPlayedAt,
    isWatched,
    episodeNumber,
    resolution,
    fileSize,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'videos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Video> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('folder_id')) {
      context.handle(
        _folderIdMeta,
        folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('extension')) {
      context.handle(
        _extensionMeta,
        extension.isAcceptableOrUnknown(data['extension']!, _extensionMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('last_position')) {
      context.handle(
        _lastPositionMeta,
        lastPosition.isAcceptableOrUnknown(
          data['last_position']!,
          _lastPositionMeta,
        ),
      );
    }
    if (data.containsKey('last_played_at')) {
      context.handle(
        _lastPlayedAtMeta,
        lastPlayedAt.isAcceptableOrUnknown(
          data['last_played_at']!,
          _lastPlayedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_watched')) {
      context.handle(
        _isWatchedMeta,
        isWatched.isAcceptableOrUnknown(data['is_watched']!, _isWatchedMeta),
      );
    }
    if (data.containsKey('episode_number')) {
      context.handle(
        _episodeNumberMeta,
        episodeNumber.isAcceptableOrUnknown(
          data['episode_number']!,
          _episodeNumberMeta,
        ),
      );
    }
    if (data.containsKey('resolution')) {
      context.handle(
        _resolutionMeta,
        resolution.isAcceptableOrUnknown(data['resolution']!, _resolutionMeta),
      );
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Video map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Video(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      folderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}folder_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      extension: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extension'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
      lastPosition: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_position'],
      )!,
      lastPlayedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_played_at'],
      ),
      isWatched: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_watched'],
      )!,
      episodeNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_number'],
      ),
      resolution: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resolution'],
      ),
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      ),
    );
  }

  @override
  $VideosTable createAlias(String alias) {
    return $VideosTable(attachedDatabase, alias);
  }
}

class Video extends DataClass implements Insertable<Video> {
  final int id;
  final int folderId;
  final String title;
  final String path;
  final String? extension;
  final int duration;
  final int lastPosition;
  final DateTime? lastPlayedAt;
  final bool isWatched;
  final int? episodeNumber;
  final String? resolution;
  final int? fileSize;
  const Video({
    required this.id,
    required this.folderId,
    required this.title,
    required this.path,
    this.extension,
    required this.duration,
    required this.lastPosition,
    this.lastPlayedAt,
    required this.isWatched,
    this.episodeNumber,
    this.resolution,
    this.fileSize,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['folder_id'] = Variable<int>(folderId);
    map['title'] = Variable<String>(title);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || extension != null) {
      map['extension'] = Variable<String>(extension);
    }
    map['duration'] = Variable<int>(duration);
    map['last_position'] = Variable<int>(lastPosition);
    if (!nullToAbsent || lastPlayedAt != null) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt);
    }
    map['is_watched'] = Variable<bool>(isWatched);
    if (!nullToAbsent || episodeNumber != null) {
      map['episode_number'] = Variable<int>(episodeNumber);
    }
    if (!nullToAbsent || resolution != null) {
      map['resolution'] = Variable<String>(resolution);
    }
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<int>(fileSize);
    }
    return map;
  }

  VideosCompanion toCompanion(bool nullToAbsent) {
    return VideosCompanion(
      id: Value(id),
      folderId: Value(folderId),
      title: Value(title),
      path: Value(path),
      extension: extension == null && nullToAbsent
          ? const Value.absent()
          : Value(extension),
      duration: Value(duration),
      lastPosition: Value(lastPosition),
      lastPlayedAt: lastPlayedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayedAt),
      isWatched: Value(isWatched),
      episodeNumber: episodeNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeNumber),
      resolution: resolution == null && nullToAbsent
          ? const Value.absent()
          : Value(resolution),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
    );
  }

  factory Video.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Video(
      id: serializer.fromJson<int>(json['id']),
      folderId: serializer.fromJson<int>(json['folderId']),
      title: serializer.fromJson<String>(json['title']),
      path: serializer.fromJson<String>(json['path']),
      extension: serializer.fromJson<String?>(json['extension']),
      duration: serializer.fromJson<int>(json['duration']),
      lastPosition: serializer.fromJson<int>(json['lastPosition']),
      lastPlayedAt: serializer.fromJson<DateTime?>(json['lastPlayedAt']),
      isWatched: serializer.fromJson<bool>(json['isWatched']),
      episodeNumber: serializer.fromJson<int?>(json['episodeNumber']),
      resolution: serializer.fromJson<String?>(json['resolution']),
      fileSize: serializer.fromJson<int?>(json['fileSize']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'folderId': serializer.toJson<int>(folderId),
      'title': serializer.toJson<String>(title),
      'path': serializer.toJson<String>(path),
      'extension': serializer.toJson<String?>(extension),
      'duration': serializer.toJson<int>(duration),
      'lastPosition': serializer.toJson<int>(lastPosition),
      'lastPlayedAt': serializer.toJson<DateTime?>(lastPlayedAt),
      'isWatched': serializer.toJson<bool>(isWatched),
      'episodeNumber': serializer.toJson<int?>(episodeNumber),
      'resolution': serializer.toJson<String?>(resolution),
      'fileSize': serializer.toJson<int?>(fileSize),
    };
  }

  Video copyWith({
    int? id,
    int? folderId,
    String? title,
    String? path,
    Value<String?> extension = const Value.absent(),
    int? duration,
    int? lastPosition,
    Value<DateTime?> lastPlayedAt = const Value.absent(),
    bool? isWatched,
    Value<int?> episodeNumber = const Value.absent(),
    Value<String?> resolution = const Value.absent(),
    Value<int?> fileSize = const Value.absent(),
  }) => Video(
    id: id ?? this.id,
    folderId: folderId ?? this.folderId,
    title: title ?? this.title,
    path: path ?? this.path,
    extension: extension.present ? extension.value : this.extension,
    duration: duration ?? this.duration,
    lastPosition: lastPosition ?? this.lastPosition,
    lastPlayedAt: lastPlayedAt.present ? lastPlayedAt.value : this.lastPlayedAt,
    isWatched: isWatched ?? this.isWatched,
    episodeNumber: episodeNumber.present
        ? episodeNumber.value
        : this.episodeNumber,
    resolution: resolution.present ? resolution.value : this.resolution,
    fileSize: fileSize.present ? fileSize.value : this.fileSize,
  );
  Video copyWithCompanion(VideosCompanion data) {
    return Video(
      id: data.id.present ? data.id.value : this.id,
      folderId: data.folderId.present ? data.folderId.value : this.folderId,
      title: data.title.present ? data.title.value : this.title,
      path: data.path.present ? data.path.value : this.path,
      extension: data.extension.present ? data.extension.value : this.extension,
      duration: data.duration.present ? data.duration.value : this.duration,
      lastPosition: data.lastPosition.present
          ? data.lastPosition.value
          : this.lastPosition,
      lastPlayedAt: data.lastPlayedAt.present
          ? data.lastPlayedAt.value
          : this.lastPlayedAt,
      isWatched: data.isWatched.present ? data.isWatched.value : this.isWatched,
      episodeNumber: data.episodeNumber.present
          ? data.episodeNumber.value
          : this.episodeNumber,
      resolution: data.resolution.present
          ? data.resolution.value
          : this.resolution,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Video(')
          ..write('id: $id, ')
          ..write('folderId: $folderId, ')
          ..write('title: $title, ')
          ..write('path: $path, ')
          ..write('extension: $extension, ')
          ..write('duration: $duration, ')
          ..write('lastPosition: $lastPosition, ')
          ..write('lastPlayedAt: $lastPlayedAt, ')
          ..write('isWatched: $isWatched, ')
          ..write('episodeNumber: $episodeNumber, ')
          ..write('resolution: $resolution, ')
          ..write('fileSize: $fileSize')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    folderId,
    title,
    path,
    extension,
    duration,
    lastPosition,
    lastPlayedAt,
    isWatched,
    episodeNumber,
    resolution,
    fileSize,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Video &&
          other.id == this.id &&
          other.folderId == this.folderId &&
          other.title == this.title &&
          other.path == this.path &&
          other.extension == this.extension &&
          other.duration == this.duration &&
          other.lastPosition == this.lastPosition &&
          other.lastPlayedAt == this.lastPlayedAt &&
          other.isWatched == this.isWatched &&
          other.episodeNumber == this.episodeNumber &&
          other.resolution == this.resolution &&
          other.fileSize == this.fileSize);
}

class VideosCompanion extends UpdateCompanion<Video> {
  final Value<int> id;
  final Value<int> folderId;
  final Value<String> title;
  final Value<String> path;
  final Value<String?> extension;
  final Value<int> duration;
  final Value<int> lastPosition;
  final Value<DateTime?> lastPlayedAt;
  final Value<bool> isWatched;
  final Value<int?> episodeNumber;
  final Value<String?> resolution;
  final Value<int?> fileSize;
  const VideosCompanion({
    this.id = const Value.absent(),
    this.folderId = const Value.absent(),
    this.title = const Value.absent(),
    this.path = const Value.absent(),
    this.extension = const Value.absent(),
    this.duration = const Value.absent(),
    this.lastPosition = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.episodeNumber = const Value.absent(),
    this.resolution = const Value.absent(),
    this.fileSize = const Value.absent(),
  });
  VideosCompanion.insert({
    this.id = const Value.absent(),
    required int folderId,
    required String title,
    required String path,
    this.extension = const Value.absent(),
    this.duration = const Value.absent(),
    this.lastPosition = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.episodeNumber = const Value.absent(),
    this.resolution = const Value.absent(),
    this.fileSize = const Value.absent(),
  }) : folderId = Value(folderId),
       title = Value(title),
       path = Value(path);
  static Insertable<Video> custom({
    Expression<int>? id,
    Expression<int>? folderId,
    Expression<String>? title,
    Expression<String>? path,
    Expression<String>? extension,
    Expression<int>? duration,
    Expression<int>? lastPosition,
    Expression<DateTime>? lastPlayedAt,
    Expression<bool>? isWatched,
    Expression<int>? episodeNumber,
    Expression<String>? resolution,
    Expression<int>? fileSize,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (folderId != null) 'folder_id': folderId,
      if (title != null) 'title': title,
      if (path != null) 'path': path,
      if (extension != null) 'extension': extension,
      if (duration != null) 'duration': duration,
      if (lastPosition != null) 'last_position': lastPosition,
      if (lastPlayedAt != null) 'last_played_at': lastPlayedAt,
      if (isWatched != null) 'is_watched': isWatched,
      if (episodeNumber != null) 'episode_number': episodeNumber,
      if (resolution != null) 'resolution': resolution,
      if (fileSize != null) 'file_size': fileSize,
    });
  }

  VideosCompanion copyWith({
    Value<int>? id,
    Value<int>? folderId,
    Value<String>? title,
    Value<String>? path,
    Value<String?>? extension,
    Value<int>? duration,
    Value<int>? lastPosition,
    Value<DateTime?>? lastPlayedAt,
    Value<bool>? isWatched,
    Value<int?>? episodeNumber,
    Value<String?>? resolution,
    Value<int?>? fileSize,
  }) {
    return VideosCompanion(
      id: id ?? this.id,
      folderId: folderId ?? this.folderId,
      title: title ?? this.title,
      path: path ?? this.path,
      extension: extension ?? this.extension,
      duration: duration ?? this.duration,
      lastPosition: lastPosition ?? this.lastPosition,
      lastPlayedAt: lastPlayedAt ?? this.lastPlayedAt,
      isWatched: isWatched ?? this.isWatched,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      resolution: resolution ?? this.resolution,
      fileSize: fileSize ?? this.fileSize,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (folderId.present) {
      map['folder_id'] = Variable<int>(folderId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (extension.present) {
      map['extension'] = Variable<String>(extension.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (lastPosition.present) {
      map['last_position'] = Variable<int>(lastPosition.value);
    }
    if (lastPlayedAt.present) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt.value);
    }
    if (isWatched.present) {
      map['is_watched'] = Variable<bool>(isWatched.value);
    }
    if (episodeNumber.present) {
      map['episode_number'] = Variable<int>(episodeNumber.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideosCompanion(')
          ..write('id: $id, ')
          ..write('folderId: $folderId, ')
          ..write('title: $title, ')
          ..write('path: $path, ')
          ..write('extension: $extension, ')
          ..write('duration: $duration, ')
          ..write('lastPosition: $lastPosition, ')
          ..write('lastPlayedAt: $lastPlayedAt, ')
          ..write('isWatched: $isWatched, ')
          ..write('episodeNumber: $episodeNumber, ')
          ..write('resolution: $resolution, ')
          ..write('fileSize: $fileSize')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StorageSourcesTable storageSources = $StorageSourcesTable(this);
  late final $FoldersTable folders = $FoldersTable(this);
  late final $VideosTable videos = $VideosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    storageSources,
    folders,
    videos,
  ];
}

typedef $$StorageSourcesTableCreateCompanionBuilder =
    StorageSourcesCompanion Function({
      Value<int> id,
      required String mountPath,
      Value<String> label,
      Value<DateTime?> lastScanned,
      Value<bool> isOffline,
    });
typedef $$StorageSourcesTableUpdateCompanionBuilder =
    StorageSourcesCompanion Function({
      Value<int> id,
      Value<String> mountPath,
      Value<String> label,
      Value<DateTime?> lastScanned,
      Value<bool> isOffline,
    });

final class $$StorageSourcesTableReferences
    extends BaseReferences<_$AppDatabase, $StorageSourcesTable, StorageSource> {
  $$StorageSourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$FoldersTable, List<Folder>> _foldersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.folders,
    aliasName: $_aliasNameGenerator(db.storageSources.id, db.folders.sourceId),
  );

  $$FoldersTableProcessedTableManager get foldersRefs {
    final manager = $$FoldersTableTableManager(
      $_db,
      $_db.folders,
    ).filter((f) => f.sourceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_foldersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StorageSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $StorageSourcesTable> {
  $$StorageSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mountPath => $composableBuilder(
    column: $table.mountPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastScanned => $composableBuilder(
    column: $table.lastScanned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOffline => $composableBuilder(
    column: $table.isOffline,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> foldersRefs(
    Expression<bool> Function($$FoldersTableFilterComposer f) f,
  ) {
    final $$FoldersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.folders,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableFilterComposer(
            $db: $db,
            $table: $db.folders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StorageSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $StorageSourcesTable> {
  $$StorageSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mountPath => $composableBuilder(
    column: $table.mountPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastScanned => $composableBuilder(
    column: $table.lastScanned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOffline => $composableBuilder(
    column: $table.isOffline,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StorageSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StorageSourcesTable> {
  $$StorageSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mountPath =>
      $composableBuilder(column: $table.mountPath, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<DateTime> get lastScanned => $composableBuilder(
    column: $table.lastScanned,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOffline =>
      $composableBuilder(column: $table.isOffline, builder: (column) => column);

  Expression<T> foldersRefs<T extends Object>(
    Expression<T> Function($$FoldersTableAnnotationComposer a) f,
  ) {
    final $$FoldersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.folders,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableAnnotationComposer(
            $db: $db,
            $table: $db.folders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StorageSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StorageSourcesTable,
          StorageSource,
          $$StorageSourcesTableFilterComposer,
          $$StorageSourcesTableOrderingComposer,
          $$StorageSourcesTableAnnotationComposer,
          $$StorageSourcesTableCreateCompanionBuilder,
          $$StorageSourcesTableUpdateCompanionBuilder,
          (StorageSource, $$StorageSourcesTableReferences),
          StorageSource,
          PrefetchHooks Function({bool foldersRefs})
        > {
  $$StorageSourcesTableTableManager(
    _$AppDatabase db,
    $StorageSourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> mountPath = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<DateTime?> lastScanned = const Value.absent(),
                Value<bool> isOffline = const Value.absent(),
              }) => StorageSourcesCompanion(
                id: id,
                mountPath: mountPath,
                label: label,
                lastScanned: lastScanned,
                isOffline: isOffline,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String mountPath,
                Value<String> label = const Value.absent(),
                Value<DateTime?> lastScanned = const Value.absent(),
                Value<bool> isOffline = const Value.absent(),
              }) => StorageSourcesCompanion.insert(
                id: id,
                mountPath: mountPath,
                label: label,
                lastScanned: lastScanned,
                isOffline: isOffline,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StorageSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({foldersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (foldersRefs) db.folders],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (foldersRefs)
                    await $_getPrefetchedData<
                      StorageSource,
                      $StorageSourcesTable,
                      Folder
                    >(
                      currentTable: table,
                      referencedTable: $$StorageSourcesTableReferences
                          ._foldersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$StorageSourcesTableReferences(
                            db,
                            table,
                            p0,
                          ).foldersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sourceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StorageSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StorageSourcesTable,
      StorageSource,
      $$StorageSourcesTableFilterComposer,
      $$StorageSourcesTableOrderingComposer,
      $$StorageSourcesTableAnnotationComposer,
      $$StorageSourcesTableCreateCompanionBuilder,
      $$StorageSourcesTableUpdateCompanionBuilder,
      (StorageSource, $$StorageSourcesTableReferences),
      StorageSource,
      PrefetchHooks Function({bool foldersRefs})
    >;
typedef $$FoldersTableCreateCompanionBuilder =
    FoldersCompanion Function({
      Value<int> id,
      required int sourceId,
      required String path,
      required String name,
      Value<String?> coverPath,
      Value<bool> isFavorite,
    });
typedef $$FoldersTableUpdateCompanionBuilder =
    FoldersCompanion Function({
      Value<int> id,
      Value<int> sourceId,
      Value<String> path,
      Value<String> name,
      Value<String?> coverPath,
      Value<bool> isFavorite,
    });

final class $$FoldersTableReferences
    extends BaseReferences<_$AppDatabase, $FoldersTable, Folder> {
  $$FoldersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StorageSourcesTable _sourceIdTable(_$AppDatabase db) =>
      db.storageSources.createAlias(
        $_aliasNameGenerator(db.folders.sourceId, db.storageSources.id),
      );

  $$StorageSourcesTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<int>('source_id')!;

    final manager = $$StorageSourcesTableTableManager(
      $_db,
      $_db.storageSources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$VideosTable, List<Video>> _videosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.videos,
    aliasName: $_aliasNameGenerator(db.folders.id, db.videos.folderId),
  );

  $$VideosTableProcessedTableManager get videosRefs {
    final manager = $$VideosTableTableManager(
      $_db,
      $_db.videos,
    ).filter((f) => f.folderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_videosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FoldersTableFilterComposer
    extends Composer<_$AppDatabase, $FoldersTable> {
  $$FoldersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  $$StorageSourcesTableFilterComposer get sourceId {
    final $$StorageSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.storageSources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageSourcesTableFilterComposer(
            $db: $db,
            $table: $db.storageSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> videosRefs(
    Expression<bool> Function($$VideosTableFilterComposer f) f,
  ) {
    final $$VideosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.videos,
      getReferencedColumn: (t) => t.folderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VideosTableFilterComposer(
            $db: $db,
            $table: $db.videos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoldersTableOrderingComposer
    extends Composer<_$AppDatabase, $FoldersTable> {
  $$FoldersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  $$StorageSourcesTableOrderingComposer get sourceId {
    final $$StorageSourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.storageSources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageSourcesTableOrderingComposer(
            $db: $db,
            $table: $db.storageSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FoldersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoldersTable> {
  $$FoldersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  $$StorageSourcesTableAnnotationComposer get sourceId {
    final $$StorageSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.storageSources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.storageSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> videosRefs<T extends Object>(
    Expression<T> Function($$VideosTableAnnotationComposer a) f,
  ) {
    final $$VideosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.videos,
      getReferencedColumn: (t) => t.folderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VideosTableAnnotationComposer(
            $db: $db,
            $table: $db.videos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoldersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoldersTable,
          Folder,
          $$FoldersTableFilterComposer,
          $$FoldersTableOrderingComposer,
          $$FoldersTableAnnotationComposer,
          $$FoldersTableCreateCompanionBuilder,
          $$FoldersTableUpdateCompanionBuilder,
          (Folder, $$FoldersTableReferences),
          Folder,
          PrefetchHooks Function({bool sourceId, bool videosRefs})
        > {
  $$FoldersTableTableManager(_$AppDatabase db, $FoldersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoldersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoldersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoldersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sourceId = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
              }) => FoldersCompanion(
                id: id,
                sourceId: sourceId,
                path: path,
                name: name,
                coverPath: coverPath,
                isFavorite: isFavorite,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sourceId,
                required String path,
                required String name,
                Value<String?> coverPath = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
              }) => FoldersCompanion.insert(
                id: id,
                sourceId: sourceId,
                path: path,
                name: name,
                coverPath: coverPath,
                isFavorite: isFavorite,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FoldersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sourceId = false, videosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (videosRefs) db.videos],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sourceId,
                                referencedTable: $$FoldersTableReferences
                                    ._sourceIdTable(db),
                                referencedColumn: $$FoldersTableReferences
                                    ._sourceIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (videosRefs)
                    await $_getPrefetchedData<Folder, $FoldersTable, Video>(
                      currentTable: table,
                      referencedTable: $$FoldersTableReferences
                          ._videosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FoldersTableReferences(db, table, p0).videosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.folderId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FoldersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoldersTable,
      Folder,
      $$FoldersTableFilterComposer,
      $$FoldersTableOrderingComposer,
      $$FoldersTableAnnotationComposer,
      $$FoldersTableCreateCompanionBuilder,
      $$FoldersTableUpdateCompanionBuilder,
      (Folder, $$FoldersTableReferences),
      Folder,
      PrefetchHooks Function({bool sourceId, bool videosRefs})
    >;
typedef $$VideosTableCreateCompanionBuilder =
    VideosCompanion Function({
      Value<int> id,
      required int folderId,
      required String title,
      required String path,
      Value<String?> extension,
      Value<int> duration,
      Value<int> lastPosition,
      Value<DateTime?> lastPlayedAt,
      Value<bool> isWatched,
      Value<int?> episodeNumber,
      Value<String?> resolution,
      Value<int?> fileSize,
    });
typedef $$VideosTableUpdateCompanionBuilder =
    VideosCompanion Function({
      Value<int> id,
      Value<int> folderId,
      Value<String> title,
      Value<String> path,
      Value<String?> extension,
      Value<int> duration,
      Value<int> lastPosition,
      Value<DateTime?> lastPlayedAt,
      Value<bool> isWatched,
      Value<int?> episodeNumber,
      Value<String?> resolution,
      Value<int?> fileSize,
    });

final class $$VideosTableReferences
    extends BaseReferences<_$AppDatabase, $VideosTable, Video> {
  $$VideosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FoldersTable _folderIdTable(_$AppDatabase db) => db.folders
      .createAlias($_aliasNameGenerator(db.videos.folderId, db.folders.id));

  $$FoldersTableProcessedTableManager get folderId {
    final $_column = $_itemColumn<int>('folder_id')!;

    final manager = $$FoldersTableTableManager(
      $_db,
      $_db.folders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_folderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VideosTableFilterComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastPosition => $composableBuilder(
    column: $table.lastPosition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWatched => $composableBuilder(
    column: $table.isWatched,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resolution => $composableBuilder(
    column: $table.resolution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  $$FoldersTableFilterComposer get folderId {
    final $$FoldersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.folderId,
      referencedTable: $db.folders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableFilterComposer(
            $db: $db,
            $table: $db.folders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VideosTableOrderingComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastPosition => $composableBuilder(
    column: $table.lastPosition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWatched => $composableBuilder(
    column: $table.isWatched,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resolution => $composableBuilder(
    column: $table.resolution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  $$FoldersTableOrderingComposer get folderId {
    final $$FoldersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.folderId,
      referencedTable: $db.folders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableOrderingComposer(
            $db: $db,
            $table: $db.folders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VideosTableAnnotationComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get extension =>
      $composableBuilder(column: $table.extension, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get lastPosition => $composableBuilder(
    column: $table.lastPosition,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isWatched =>
      $composableBuilder(column: $table.isWatched, builder: (column) => column);

  GeneratedColumn<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resolution => $composableBuilder(
    column: $table.resolution,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  $$FoldersTableAnnotationComposer get folderId {
    final $$FoldersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.folderId,
      referencedTable: $db.folders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoldersTableAnnotationComposer(
            $db: $db,
            $table: $db.folders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VideosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VideosTable,
          Video,
          $$VideosTableFilterComposer,
          $$VideosTableOrderingComposer,
          $$VideosTableAnnotationComposer,
          $$VideosTableCreateCompanionBuilder,
          $$VideosTableUpdateCompanionBuilder,
          (Video, $$VideosTableReferences),
          Video,
          PrefetchHooks Function({bool folderId})
        > {
  $$VideosTableTableManager(_$AppDatabase db, $VideosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> folderId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String?> extension = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<int> lastPosition = const Value.absent(),
                Value<DateTime?> lastPlayedAt = const Value.absent(),
                Value<bool> isWatched = const Value.absent(),
                Value<int?> episodeNumber = const Value.absent(),
                Value<String?> resolution = const Value.absent(),
                Value<int?> fileSize = const Value.absent(),
              }) => VideosCompanion(
                id: id,
                folderId: folderId,
                title: title,
                path: path,
                extension: extension,
                duration: duration,
                lastPosition: lastPosition,
                lastPlayedAt: lastPlayedAt,
                isWatched: isWatched,
                episodeNumber: episodeNumber,
                resolution: resolution,
                fileSize: fileSize,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int folderId,
                required String title,
                required String path,
                Value<String?> extension = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<int> lastPosition = const Value.absent(),
                Value<DateTime?> lastPlayedAt = const Value.absent(),
                Value<bool> isWatched = const Value.absent(),
                Value<int?> episodeNumber = const Value.absent(),
                Value<String?> resolution = const Value.absent(),
                Value<int?> fileSize = const Value.absent(),
              }) => VideosCompanion.insert(
                id: id,
                folderId: folderId,
                title: title,
                path: path,
                extension: extension,
                duration: duration,
                lastPosition: lastPosition,
                lastPlayedAt: lastPlayedAt,
                isWatched: isWatched,
                episodeNumber: episodeNumber,
                resolution: resolution,
                fileSize: fileSize,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VideosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({folderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (folderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.folderId,
                                referencedTable: $$VideosTableReferences
                                    ._folderIdTable(db),
                                referencedColumn: $$VideosTableReferences
                                    ._folderIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VideosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VideosTable,
      Video,
      $$VideosTableFilterComposer,
      $$VideosTableOrderingComposer,
      $$VideosTableAnnotationComposer,
      $$VideosTableCreateCompanionBuilder,
      $$VideosTableUpdateCompanionBuilder,
      (Video, $$VideosTableReferences),
      Video,
      PrefetchHooks Function({bool folderId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StorageSourcesTableTableManager get storageSources =>
      $$StorageSourcesTableTableManager(_db, _db.storageSources);
  $$FoldersTableTableManager get folders =>
      $$FoldersTableTableManager(_db, _db.folders);
  $$VideosTableTableManager get videos =>
      $$VideosTableTableManager(_db, _db.videos);
}

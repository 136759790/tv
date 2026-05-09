import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// 必须匹配文件名，运行 build_runner 后生成
part 'database.g.dart';

// 1. 存储源表：区分不同的 U 盘或内存
class StorageSources extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mountPath => text().unique()(); // 挂载路径，如 /storage/XXXX-XXXX
  TextColumn get label => text().withDefault(const Constant('外部存储'))();
  DateTimeColumn get lastScanned => dateTime().nullable()();
  BoolColumn get isOffline =>
      boolean().withDefault(const Constant(false))(); // U盘是否拔出
}

// 2. 文件夹表：用于首页分块显示
class Folders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sourceId => integer().references(StorageSources, #id)();
  TextColumn get path => text().unique()();
  TextColumn get name => text()();
  TextColumn get coverPath => text().nullable()(); // 文件夹封面图路径
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}

// 3. 视频表：存储详细信息
class Videos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get folderId => integer().references(Folders, #id)();
  TextColumn get title => text()();
  TextColumn get path => text().unique()();
  TextColumn get extension => text().nullable()(); // .mp4, .mkv

  // 播放数据
  IntColumn get duration => integer().withDefault(const Constant(0))();
  IntColumn get lastPosition => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPlayedAt => dateTime().nullable()();
  BoolColumn get isWatched => boolean().withDefault(const Constant(false))();

  // 增强功能
  IntColumn get episodeNumber => integer().nullable()(); // 解析出的集数
  TextColumn get resolution => text().nullable()(); // 1080P/4K
  IntColumn get fileSize => integer().nullable()();
}

@DriftDatabase(tables: [StorageSources, Folders, Videos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// 物理连接
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tv_core.sqlite'));
    return NativeDatabase(file);
  });
}

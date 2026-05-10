import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:tv/base/database.dart';

final FolderService folderService = FolderService();

class FolderService {
  // 获取挂载的存储列表
  Future<List<String>> fetchUsbList() async {
    // 实际开发建议使用插件，这里演示常见安卓挂载逻辑
    // 在 Android 上，/storage 目录下通常是挂载点
    List<String> usbList = [];
    try {
      final storageDir = Directory('/storage');
      if (await storageDir.exists()) {
        final List<FileSystemEntity> entities = await storageDir
            .list()
            .toList();
        // 过滤掉不可访问或系统的 emulated 路径（可选）
        usbList.addAll(entities.map((e) => e.path).toList());
      }
    } catch (e) {
      // 如果权限受限，至少提供一个内部存储选项
      usbList.addAll(["/storage/emulated/0"]);
    }
    return usbList;
  }

  final List<String> videoExtensions = [
    '.mp4',
    '.mkv',
    '.mov',
    '.avi',
    '.wmv',
    '.flv',
  ];

  /// 核心方法：递归扫描并扁平化入库
  Future<void> scanAndSync(String rootPath) async {
    final Directory rootDir = Directory(rootPath);
    if (!await rootDir.exists()) return;

    // 1. 递归收集所有包含视频的文件夹
    // Map 结构: { 文件夹路径: [视频文件列表] }
    Map<String, List<File>> mediaMap = {};

    await _recursiveScan(rootDir, mediaMap);

    // 2. 批量事务入库
    await db.transaction(() async {
      for (var entry in mediaMap.entries) {
        final folderPath = entry.key;
        final folderName = p.basename(folderPath);
        final videoFiles = entry.value;

        // A. 插入文件夹 (使用 path 作为唯一标识防止重复)
        // 注意：数据库表设计时 path 字段建议设为 UNIQUE
        // await db
        //     .into(db.folders)
        //     .insertOnConflictUpdate(
        //       FoldersCompanion.insert(name: folderName, path: folderPath),
        //     );

        // // B. 准备该文件夹下的视频数据
        // final List<VideosCompanion> videoEntries = videoFiles.map((file) {
        //   return VideosCompanion.insert(
        //     title: p.basename(file.path),
        //     path: file.path,
        //     folderName: folderName, // 关联文件夹名或 ID
        //     createdAt: DateTime.now(),
        //   );
        // }).toList();

        // // C. 批量插入视频
        // await db.batch((batch) {
        //   batch.insertAllOnConflictUpdate(db.videos, videoEntries);
        // });
      }
    });
  }

  /// 递归辅助函数
  Future<void> _recursiveScan(
    Directory dir,
    Map<String, List<File>> map,
  ) async {
    try {
      // 排除隐藏文件夹 (如 .android, .thumbnails)
      if (p.basename(dir.path).startsWith('.')) return;

      final List<FileSystemEntity> entities = await dir
          .list(recursive: false)
          .toList();
      List<File> currentFolderVideos = [];

      for (var entity in entities) {
        if (entity is Directory) {
          // 递归进入子文件夹
          await _recursiveScan(entity, map);
        } else if (entity is File) {
          // 检查是否为视频格式
          String ext = p.extension(entity.path).toLowerCase();
          if (videoExtensions.contains(ext)) {
            currentFolderVideos.add(entity);
          }
        }
      }

      // 如果当前目录有视频，记录下来
      if (currentFolderVideos.isNotEmpty) {
        map[dir.path] = currentFolderVideos;
      }
    } catch (e) {
      // 避免某些目录无权限导致扫描中断
      print("Error scanning ${dir.path}: $e");
    }
  }

  Stream<List<Folder>> watchFolders() {
    return (db.select(
      db.folders,
    )..orderBy([(t) => OrderingTerm(expression: t.name, mode: .asc)])).watch();
  }
}

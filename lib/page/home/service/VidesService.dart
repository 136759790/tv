import 'package:tv/base/database.dart';
import 'package:drift/drift.dart';

final VideoService videoService = VideoService();

class VideoService {
  Stream<List<Video>> watchRecentVideos() {
    return (db.select(db.videos)
          ..where(
            (t) => t.lastPosition.isBiggerThan(const Constant(0)),
          ) // 使用 const Constant(0)// 关键点：使用 Value 版本
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.lastPlayedAt,
              mode: .desc,
            ), // 按播放时间倒序
          ])
          ..limit(20)) // 取最近 20 条
        .watch();
  }
}

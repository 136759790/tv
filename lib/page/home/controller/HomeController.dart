import 'package:get/get.dart';
import 'package:tv/base/database.dart';
import 'package:tv/page/home/service/VidesService.dart';

class HomeController extends GetxController {
  // 2. 响应式变量
  var recentVideos = <Video>[].obs; // 最近观看
  var folders = <Folder>[].obs; // 首页文件夹
  var currentUsbPath = "".obs; // 当前挂载的 U 盘路径
  // 2. 扫描状态控制
  final isScanning = false.obs;
  final isUsbConnected = true.obs;
  final List<String> videoExtensions = ['.mp4', '.mkv', '.mov', '.avi', '.wmv'];

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  // 清空数据（测试用）
  void clearData() {
    folders.clear();
    recentVideos.clear();
  }

  /// 刷新首页数据
  Future<void> refreshData() async {
    recentVideos.bindStream(videoService.watchRecentVideos());
  }
}

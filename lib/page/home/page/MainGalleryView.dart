import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tv/base/Color.dart';
import 'package:tv/page/home/service/FolderService.dart'; // 确保定义了 slate, emerald 等颜色

class MainGalleryView extends StatefulWidget {
  const MainGalleryView({super.key});

  @override
  State<MainGalleryView> createState() => _MainGalleryViewState();
}

class _MainGalleryViewState extends State<MainGalleryView> {
  // 模拟数据：你可以手动将这两个列表设为 [] 来测试空状态
  List<String> _recentVideos = [];
  List<String> _folders = [];

  @override
  Widget build(BuildContext context) {
    // 逻辑：如果两个列表都为空，则显示引导页面
    bool isEmpty = _recentVideos.isEmpty && _folders.isEmpty;

    return Container(
      color: slate950,
      width: double.infinity,
      height: double.infinity,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: isEmpty ? _buildEmptyState() : _buildMainContent(),
      ),
    );
  }

  // --- 1. 主内容区 (已有数据时) ---
  Widget _buildMainContent() {
    return SingleChildScrollView(
      key: const ValueKey("hasData"), // 用于 AnimatedSwitcher 识别
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopStatus(),
          const SizedBox(height: 40),
          _buildSectionHeader("继续观看", LucideIcons.history),
          const SizedBox(height: 20),
          _buildRecentHorizontalList(),
          const SizedBox(height: 50),
          _buildSectionHeader("全部文件夹", LucideIcons.layoutGrid),
          const SizedBox(height: 20),
          _buildFolderGrid(),
        ],
      ),
    );
  }

  // --- 2. 空状态引导区 (无数据时) ---
  Widget _buildEmptyState() {
    return Center(
      key: const ValueKey("empty"), // 用于 AnimatedSwitcher 识别
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 图标装饰
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(color: slate900, shape: BoxShape.circle),
            child: Icon(LucideIcons.hardDrive, size: 80, color: slate700),
          ),
          const SizedBox(height: 32),
          const Text(
            "开启影音之旅",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "尚未发现媒体资源，请插上 U 盘或扫描本地目录",
            style: TextStyle(color: slate500, fontSize: 18),
          ),
          const SizedBox(height: 48),

          // 引导按钮
          Focus(
            autofocus: true, // 页面进来自动选中这个按钮
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent &&
                  (event.logicalKey == LogicalKeyboardKey.select ||
                      event.logicalKey == LogicalKeyboardKey.enter)) {
                _handleScanAction();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: Builder(
              builder: (context) {
                final bool hasFocus = Focus.of(context).hasFocus;
                return GestureDetector(
                  onTap: _handleScanAction,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: hasFocus ? emerald500 : slate900,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: hasFocus
                          ? [
                              BoxShadow(
                                color: emerald500.withOpacity(0.3),
                                blurRadius: 30,
                              ),
                            ]
                          : [],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.search,
                          color: hasFocus ? Colors.black : emerald500,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "立即扫描 U 盘",
                          style: TextStyle(
                            color: hasFocus ? Colors.black : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 点击扫描后的逻辑
  void _handleScanAction() async {
    final usbList = await folderService.fetchUsbList();
    if (!mounted) return;
    Get.dialog(
      // 增加毛玻璃背景
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 450, // 稍微加宽一点更显大气
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: slate900.withOpacity(0.95),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: slate800, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 标题区
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: emerald500.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          LucideIcons.hardDrive,
                          color: emerald500,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        "选择媒体来源",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Divider(color: slate800, height: 1),
                  const SizedBox(height: 24),

                  // 设备列表
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: SingleChildScrollView(
                      child: Column(
                        children: usbList
                            .map((path) => _buildUsbItem(path))
                            .toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  _buildCancelButton(),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _buildUsbItem(String path) {
    final name = path.split('/').last;
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return GestureDetector(
            onTap: () {
              Get.back(); // 先关弹窗
              folderService.scanAndSync(path); // 后去扫描
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: hasFocus ? emerald500 : slate800.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                boxShadow: hasFocus
                    ? [
                        BoxShadow(
                          color: emerald500.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                children: [
                  Icon(
                    LucideIcons.folderSearch,
                    color: hasFocus ? Colors.black : slate400,
                    size: 22,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      name == "0" ? "内部存储" : name,
                      style: TextStyle(
                        color: hasFocus ? Colors.black : slate200,
                        fontSize: 18,
                        fontWeight: hasFocus
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (hasFocus)
                    const Icon(
                      LucideIcons.chevronRight,
                      color: Colors.black,
                      size: 20,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCancelButton() {
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasFocus ? slate400 : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "取消",
                style: TextStyle(
                  color: hasFocus ? slate200 : slate500,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  // --- 以下为你之前的 UI 构建方法，保持不变 ---

  Widget _buildTopStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "我的媒体库",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "共 ${_folders.length} 个分类，${_recentVideos.length} 条播放记录",
              style: const TextStyle(color: slate500, fontSize: 16),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: slate900,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(LucideIcons.usb, color: emerald500, size: 20),
              const SizedBox(width: 12),
              const Text(
                "USB 设备: sda1",
                style: TextStyle(color: slate300, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: emerald500, size: 22),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: slate200,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentHorizontalList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _recentVideos.length,
        itemBuilder: (context, index) => _buildRecentCard(_recentVideos[index]),
      ),
    );
  }

  Widget _buildRecentCard(String title) {
    return Focus(
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 320,
            margin: const EdgeInsets.only(right: 24),
            decoration: BoxDecoration(
              color: slate900,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: hasFocus ? emerald500 : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: slate800,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Icon(LucideIcons.play, color: slate700, size: 40),
                    ),
                  ),
                ),
                LinearProgressIndicator(
                  value: 0.6,
                  color: emerald500,
                  backgroundColor: Colors.transparent,
                  minHeight: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFolderGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 0.85,
      ),
      itemCount: _folders.length,
      itemBuilder: (context, index) => _buildFolderItem(_folders[index]),
    );
  }

  Widget _buildFolderItem(String name) {
    return Focus(
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: hasFocus ? emerald600 : slate800,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: hasFocus ? emerald500 : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: hasFocus
                        ? [
                            BoxShadow(
                              color: emerald500.withOpacity(0.5),
                              blurRadius: 15,
                            ),
                          ]
                        : [],
                  ),
                  child: Icon(
                    LucideIcons.folder,
                    color: Colors.white,
                    size: hasFocus ? 45 : 38,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 25,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: hasFocus ? Colors.white : slate400,
                    fontWeight: hasFocus ? FontWeight.bold : FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

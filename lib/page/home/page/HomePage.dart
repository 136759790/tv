import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tv/base/Color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: slate950, // 经典的深色背景
      body: Row(
        children: [
          // 1. 侧边导航栏 (Mini Sidebar)
          _buildSidebar(),

          // 2. 主内容区
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopHeader(),
                  const SizedBox(height: 40),

                  // 最近播放部分
                  _buildSectionTitle("继续观看"),
                  const SizedBox(height: 16),
                  _buildRecentList(),

                  const SizedBox(height: 48),

                  // 全部文件夹部分
                  _buildSectionTitle("全部文件夹"),
                  const SizedBox(height: 16),
                  _buildFolderGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 侧边栏
  Widget _buildSidebar() {
    return Container(
      width: 80,
      color: slate900,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Icon(LucideIcons.tv, color: emerald500, size: 32),
          const Spacer(),
          _buildSidebarIcon(LucideIcons.search),
          _buildSidebarIcon(LucideIcons.house, isSelected: true),
          _buildSidebarIcon(LucideIcons.settings),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSidebarIcon(IconData icon, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Icon(icon, color: isSelected ? Colors.white : slate500),
    );
  }

  // 顶部标题
  Widget _buildTopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "我的影库",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Icon(LucideIcons.usb, color: emerald, size: 20),
            const SizedBox(width: 8),
            Text("U盘已连接: sda1", style: TextStyle(color: slate400)),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: slate300,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // 最近播放列表 (横向滚动)
  Widget _buildRecentList() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) => _buildVideoCard(index),
      ),
    );
  }

  // 视频卡片 (具有焦点效果)
  Widget _buildVideoCard(int index) {
    return Focus(
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isFocused ? emerald500 : Colors.transparent,
                width: 3,
              ),
              color: slate900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      color: slate800,
                    ),
                    child: Center(
                      child: Icon(
                        LucideIcons.play,
                        color: Colors.white24,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                // 模拟进度条
                LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.transparent,
                  color: emerald500,
                  minHeight: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "视频名称 ${index + 1}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 文件夹宫格
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
      itemCount: 10,
      itemBuilder: (context, index) => _buildFolderItem(index),
    );
  }

  Widget _buildFolderItem(int index) {
    return Focus(
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          return Column(
            children: [
              AnimatedScale(
                scale: isFocused ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isFocused ? emerald600 : slate800,
                  ),
                  child: const Center(
                    child: Icon(
                      LucideIcons.folder,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "分类文件夹 $index",
                style: TextStyle(color: isFocused ? Colors.white : slate400),
              ),
            ],
          );
        },
      ),
    );
  }
}

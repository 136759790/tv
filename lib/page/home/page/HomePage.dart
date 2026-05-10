import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tv/base/Color.dart';
import 'package:tv/page/home/controller/Homecontroller.dart';
import 'package:tv/page/home/page/MainGalleryView.dart';
import 'package:tv/page/setting/page/SettingPage.dart'; // 确保你有对应的颜色定义

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // 默认选中“首页” (索引1)

  // 定义页面列表
  late final List<Widget> _pages;

  @override
  void initState() {
    Get.put(HomeController());
    super.initState();
    _pages = [
      const Center(
        child: Text(
          "搜索界面",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      MainGalleryView(), // 你之前的首页内容逻辑（继续观看 + 文件夹）
      const SettingPage(), // 设置界面内容
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: slate950,
      body: Row(
        children: [
          // 1. 侧边栏
          _buildSidebar(),

          // 2. 动态内容区
          Expanded(
            child: IndexedStack(index: _currentIndex, children: _pages),
          ),
        ],
      ),
    );
  }

  // --- 侧边栏构建 ---
  Widget _buildSidebar() {
    return Container(
      width: 100,
      color: slate900,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Icon(LucideIcons.playCircle, color: emerald500, size: 36),
          const Spacer(),

          _buildSidebarItem(LucideIcons.search, 0, "搜索"),
          _buildSidebarItem(LucideIcons.home, 1, "首页"),
          _buildSidebarItem(LucideIcons.settings, 2, "设置"),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  // --- 侧边栏单项逻辑 ---
  Widget _buildSidebarItem(IconData icon, int index, String label) {
    final bool isSelected = _currentIndex == index;

    return Focus(
      // 逻辑 1: 处理遥控器/键盘导航
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          setState(() => _currentIndex = index);
        }
      },
      child: Builder(
        builder: (context) {
          final bool hasFocus = Focus.of(context).hasFocus;

          return GestureDetector(
            // 逻辑 2: 处理模拟器鼠标点击
            onTap: () {
              // 这一步关键：点击时手动让当前 FocusNode 获得焦点
              Focus.of(context).requestFocus();
              setState(() => _currentIndex = index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: hasFocus || isSelected ? slate800 : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: hasFocus ? emerald500 : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                color: hasFocus || isSelected ? emerald500 : slate500,
                size: 28,
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // 当前选中的左侧菜单索引
  int _selectedIndex = 0;

  // 菜单配置
  final List<Map<String, dynamic>> _menuItems = [
    {'icon': LucideIcons.hardDrive, 'label': '存储设备'},
    {'icon': LucideIcons.languages, 'label': '通用设置'},
    {'icon': LucideIcons.shieldCheck, 'label': '隐私历史'},
    {'icon': LucideIcons.info, 'label': '关于应用'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617), // Slate 950
      body: Row(
        children: [
          // 1. 左侧导航栏
          _buildSideNav(),

          // 分割线
          Container(width: 1, color: const Color(0xFF1E293B)),

          // 2. 右侧详情内容
          Expanded(child: _buildDetailContent()),
        ],
      ),
    );
  }

  /// 构建左侧菜单
  Widget _buildSideNav() {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "设置",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                return _MenuTile(
                  icon: _menuItems[index]['icon'],
                  label: _menuItems[index]['label'],
                  isSelected: _selectedIndex == index,
                  onFocus: () {
                    setState(() => _selectedIndex = index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 构建右侧内容区
  Widget _buildDetailContent() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _getSectionContent(_selectedIndex),
    );
  }

  Widget _getSectionContent(int index) {
    switch (index) {
      case 0:
        return _buildStorageSection();
      case 1:
        return _buildGeneralSection();
      default:
        return const Center(
          child: Text("更多设置开发中...", style: TextStyle(color: Colors.white54)),
        );
    }
  }

  Widget _buildStorageSection() {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "存储设备",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "管理 U 盘挂载点及媒体扫描策略",
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 48),

          // 模拟存储设备卡片
          _SettingActionCard(
            title: "外置存储 1",
            subtitle: "/storage/A1B2-C3D4",
            trailing: "查看内容",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSection() {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "通用设置",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          _SettingActionCard(
            title: "界面语言",
            subtitle: "简体中文",
            trailing: "切换",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

/// 内部组件：左侧菜单项（处理焦点变化）
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onFocus;

  const _MenuTile({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) onFocus();
      },
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: hasFocus ? const Color(0xFF1E293B) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(
                icon,
                color: isSelected || hasFocus
                    ? const Color(0xFF10B981)
                    : Colors.white54,
              ),
              title: Text(
                label,
                style: TextStyle(
                  color: isSelected || hasFocus ? Colors.white : Colors.white54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 内部组件：右侧操作卡片
class _SettingActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback onPressed;

  const _SettingActionCard({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: hasFocus
                  ? const Color(0xFF1E293B)
                  : const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: hasFocus
                    ? const Color(0xFF10B981)
                    : const Color(0xFF1E293B),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(color: Colors.white38),
                      ),
                    ],
                  ),
                ),
                if (hasFocus)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      trailing,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
}

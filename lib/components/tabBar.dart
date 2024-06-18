import 'package:flutter/material.dart';

class MainTabBar extends StatefulWidget {
  final TabController tabController;
  const MainTabBar({super.key, required this.tabController});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.settings),
        ),
        Tab(
          icon: Icon(Icons.person),
        ),
      ],
      controller: widget.tabController,
    );
  }
}

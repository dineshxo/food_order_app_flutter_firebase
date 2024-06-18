import 'package:flutter/material.dart';
import 'package:food_order/components/currentLocation.dart';
import 'package:food_order/components/descriptionBox.dart';
import 'package:food_order/components/silAppBar.dart';
import 'package:food_order/components/tabBar.dart';

import '../components/appDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const appDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SilAppBar(
                    title: MainTabBar(tabController: _tabController),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Currentlocation(),
                        DescriptionBox(),
                      ],
                    )),
              ],
          body: TabBarView(
            controller: _tabController,
            children: [
              Text("Hello"),
              Text("Settings"),
              Text("profile"),
            ],
          )),
    );
  }
}

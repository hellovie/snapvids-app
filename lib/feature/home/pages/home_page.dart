import 'package:flutter/material.dart';
import 'package:snapvids_app/feature/home/pages/creation_list_page.dart';
import 'package:snapvids_app/feature/home/pages/live_page.dart';

class HomePage extends StatefulWidget {
  final int index;

  const HomePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  static const List<Widget> _tabs = [
    Tab(text: 'For You'),
    Tab(text: 'Following'),
    Tab(text: 'Live'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: SafeArea(
                top: false,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    CreationListPage(),
                    CreationListPage(),
                    LivePage(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: statusBarHeight,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 30.0,
                        ),
                      ],
                    ),
                    child: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      tabs: _tabs,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

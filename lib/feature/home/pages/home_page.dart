import 'package:flutter/material.dart';
import 'package:snapvids_app/common/models/creation_model.dart';
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
  late List<CreationModel> forYouCreations;
  late List<CreationModel> followingCreations;

  @override
  void initState() {
    forYouCreations = [
      CreationModel(
        id: 1,
        caption: 'Snapvids, a short video mobile APP based on Spring Boot and Flutter.',
        authorNickname: 'Hellovie',
        authorAvatarUrl: 'https://avatars.githubusercontent.com/u/98229169?s=400&u=a710b279be750828e824b28d8a66c55a5b10a58a&v=4',
        isLiked: true,
        likeCount: 99999,
        isCollectd: true,
        collectCount: 12138,
        commentCount: 567,
        shareCount: 70,
        bgmName: "Nothing's Gonna Change My Love For You",
        bgmCoverUrl: '',
        isFollowed: true,
        isPlay: false,
      ),
      CreationModel(
        id: 2,
        caption: 'Snapvids，一款基于 Spring Boot 和 Flutter 的短视频移动 APP。',
        authorNickname: '再睡5分钟吧',
        authorAvatarUrl: 'https://hellovie.github.io/img/avatar.jpg',
        isLiked: false,
        likeCount: 88,
        isCollectd: false,
        collectCount: 0,
        commentCount: 1,
        shareCount: 0,
        bgmName: 'Love Song',
        bgmCoverUrl: 'https://ww4.sinaimg.cn/mw690/65c91eddjw1e826ijlx7rj20hs0hsdh0.jpg',
        isFollowed: false,
        isPlay: true,
      ),
    ];
    followingCreations = [];
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
                  children: [
                    CreationListPage(forYouCreations),
                    CreationListPage(followingCreations),
                    const LivePage(),
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

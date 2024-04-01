import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapvids_app/common/config/icon_assets.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/feature/Index/widgets/bottom_navigation.dart';
import 'package:snapvids_app/feature/activity/pages/activity_page.dart';
import 'package:snapvids_app/feature/creation/pages/creation_page.dart';
import 'package:snapvids_app/feature/discover/pages/discover_page.dart';
import 'package:snapvids_app/feature/home/pages/home_page.dart';
import 'package:snapvids_app/feature/profile/pages/profile_page.dart';

const Map<int, String> _routeTable = {
  -1: Routes.creation,
  0: Routes.home,
  1: Routes.discover,
  2: Routes.activity,
  3: Routes.profile,
};

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key? key,
  }) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double middleIconWidth = 52.0;
    const double middleIconHeight = 40.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: _onChangedIndex,
        children: const [
          HomePage(index: 0),
          DiscoverPage(index: 1),
          ActivityPage(index: 2),
          ProfilePage(index: 3),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: currentIndex,
        onTap: _onChangedIndex,
        items: [
          NavigationItemModel(
            label: "home",
            icon: IconAssets.home,
            count: 1000,
          ),
          NavigationItemModel(
            label: "discover",
            icon: IconAssets.discover,
          ),
          NavigationItemModel(
            label: "activity",
            icon: IconAssets.activity,
          ),
          NavigationItemModel(
            label: "profile",
            icon: IconAssets.profile,
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight / 2),
          child: SizedBox(
            width: middleIconWidth,
            height: middleIconHeight,
            child: FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                IconAssets.creation,
                width: middleIconWidth,
                height: middleIconHeight,
              ),
              onPressed: () => _showCreationPage(context),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future _showCreationPage(context) {
    String routeName = Routes.routeBeforeHook(_routeTable[-1]);
    if (routeName != _routeTable[-1]) {
      Navigator.pushNamed(context, Routes.login);
      return Future(() => null);
    }
    
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - statusBarHeight,
          ),
          child: const CreationPage(index: -1),
        );
      },
    );
  }

  void _onChangedIndex(int index) {
    String routeName = Routes.routeBeforeHook(_routeTable[index]);
    if (routeName != _routeTable[index]) {
      Navigator.pushNamed(context, Routes.login);
      return;
    }

    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }
}

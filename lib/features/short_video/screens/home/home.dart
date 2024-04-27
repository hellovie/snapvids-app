import 'package:flutter/material.dart';
import 'package:snapvids_app/features/short_video/models/creation_model.dart';
import 'package:snapvids_app/common/widgets/creations/creation_view.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = DeviceUtils.getStatusBarHeight();
    final double screenWidth = DeviceUtils.getScreenWidth();
    const List<Widget> tabs = [
      Tab(text: UiTexts.homeTabForYou),
      Tab(text: UiTexts.homeTabFollowing),
      Tab(text: UiTexts.homeTabLive),
    ];
    return CreationView(
      model: creationListMock[0],
      onChanged: (CreationModel value) {},
    );

    // final TabController tabController = TabController(vsync: this, length: tabs.length);

    // return Stack(
    //   children: [
    //     Positioned.fill(
    //       child: TabBarView(
    //         controller: tabController,
    //         children: [
    //           CreationView(
    //             model: creationListMock[0],
    //             onChanged: (CreationModel value) {},
    //           ),
    //           const Placeholder(),
    //           const Placeholder(),
    //         ],
    //       ),
    //     ),
    //     Positioned(
    //       top: statusBarHeight,
    //       left: 0,
    //       right: 0,
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: ConstrainedBox(
    //           constraints: const BoxConstraints(maxWidth: double.infinity),
    //           child: Container(
    //             width: screenWidth,
    //             decoration: const BoxDecoration(
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.black12,
    //                   blurRadius: 30.0,
    //                 ),
    //               ],
    //             ),
    //             child: TabBar(
    //               isScrollable: true,
    //               controller: tabController,
    //               tabs: tabs,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

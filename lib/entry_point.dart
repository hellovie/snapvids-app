import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/features/short_video/screens/creation/creation.dart';
import 'package:snapvids_app/features/short_video/screens/discover/discover.dart';
import 'package:snapvids_app/features/short_video/screens/home/home.dart';
import 'package:snapvids_app/features/short_video/screens/message/message.dart';
import 'package:snapvids_app/features/short_video/screens/profile/profile.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Rx<int> homeCount = 1.obs;
  final Rx<int> discoverCount = 70.obs;
  final Rx<int> messageCount = 999.obs;
  final Rx<int> profileCount = 0.obs;

  final List<Widget> screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    const CreationScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];
}

/// NavigationBar
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorFilter bottomAppBarUnselectedColor = ColorFilter.mode(
      context.colorExtension.bottomAppBarUnselected!,
      BlendMode.srcIn,
    );
    final ColorFilter bottomAppBarSelectedColor = ColorFilter.mode(
      context.colorExtension.bottomAppBarSelected!,
      BlendMode.srcIn,
    );

    final controller = Get.put(NavigationController());

    Future openCreationScreen(context) {
      final screenHeight = DeviceUtils.getScreenHeight();

      return showModalBottomSheet(
        context: context,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        builder: (context) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: screenHeight,
            ),
            child: const CreationScreen(),
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: UiSizes.navigationBarHeight,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            MessageNavigationDestination(
              icon: SvgPicture.asset(
                ImageAssets.navHome,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarUnselectedColor,
              ),
              selectedIcon: SvgPicture.asset(
                ImageAssets.navHomeSelected,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarSelectedColor,
              ),
              label: UiTexts.menuHome,
              count: controller.homeCount.value,
            ),
            MessageNavigationDestination(
              icon: SvgPicture.asset(
                ImageAssets.navDiscover,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarUnselectedColor,
              ),
              selectedIcon: SvgPicture.asset(
                ImageAssets.navDiscoverSelected,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarSelectedColor,
              ),
              label: UiTexts.menuDiscover,
              count: controller.discoverCount.value,
            ),
            InkWell(
              onTap: () => openCreationScreen(context),
              child: Container(
                color: Colors.transparent,
                child: SvgPicture.asset(
                  ImageAssets.navCreation,
                  width: UiSizes.navigationBarMiddleBtnHeight,
                ),
              ),
            ),
            MessageNavigationDestination(
              icon: SvgPicture.asset(
                ImageAssets.navMessage,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarUnselectedColor,
              ),
              selectedIcon: SvgPicture.asset(
                ImageAssets.navMessageSelected,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarSelectedColor,
              ),
              label: UiTexts.menuMessage,
              count: controller.messageCount.value,
            ),
            MessageNavigationDestination(
              icon: SvgPicture.asset(
                ImageAssets.navProfile,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarUnselectedColor,
              ),
              selectedIcon: SvgPicture.asset(
                ImageAssets.navProfileSelected,
                width: UiSizes.navigationBarIconSize,
                colorFilter: bottomAppBarSelectedColor,
              ),
              label: UiTexts.menuProfile,
              count: controller.profileCount.value,
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class MessageNavigationDestination extends StatelessWidget {
  const MessageNavigationDestination({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.count,
  });

  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: CountIcon(icon: icon, count: count),
      selectedIcon: CountIcon(icon: selectedIcon, count: count),
      label: label,
      tooltip: '',
    );
  }
}

class CountIcon extends StatelessWidget {
  const CountIcon({
    super.key,
    required this.icon,
    required this.count,
  });

  final Widget icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    const double messagePromptCircleTextHeight = 1.0;
    String getMessagePromptCircleText(int value) {
      return value <= 99 ? value.toString() : '99+';
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        Positioned(
          top: 0 - UiSizes.messagePromptCircle / 4,
          right: 0 - UiSizes.messagePromptCircle / 4,
          child: count != 0
              ? Container(
                  height: UiSizes.messagePromptCircle,
                  constraints: const BoxConstraints(
                    minWidth: UiSizes.messagePromptCircle,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: UiSizes.messagePromptCircleVerticalPadding,
                    horizontal: UiSizes.messagePromptCircleHorizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorExtension.messagePromptCircle,
                    borderRadius: BorderRadius.circular(
                      UiSizes.messagePromptCircle,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    getMessagePromptCircleText(count),
                    style: FontStyles.labelSmall.copyWith(
                      height: messagePromptCircleTextHeight,
                      color: context.colorExtension.onMessagePromptCircle,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

/// 以下是自定义实现
// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => BottomNavigation(
//           currentIndex: controller.selectedIndex.value,
//           onTap: (index) {
//             controller.selectedIndex.value = index;
//           },
//           items: [
//             NavigationItemModel(
//               icon: const Icon(Iconsax.home),
//               selectedIcon: const Icon(Iconsax.home_15),
//               label: UiTexts.menuHome,
//               count: controller.homeCount.value,
//             ),
//             NavigationItemModel(
//               icon: const Icon(Iconsax.category),
//               selectedIcon: const Icon(Iconsax.category5),
//               label: UiTexts.menuDiscover,
//               count: controller.discoverCount.value,
//             ),
//             NavigationItemModel(
//               icon: Container(
//                 color: Colors.transparent,
//                 child: SvgPicture.asset(
//                   ImageAssets.creation,
//                   width: UiSizes.bottomAppBarMiddleBtnHeight,
//                 ),
//               ),
//             ),
//             NavigationItemModel(
//               icon: const Icon(Iconsax.message),
//               selectedIcon: const Icon(Iconsax.message5),
//               label: UiTexts.menuMessage,
//               count: controller.messageCount.value,
//             ),
//             NavigationItemModel(
//               icon: const Icon(Iconsax.frame_14),
//               selectedIcon: const Icon(Iconsax.frame5),
//               label: UiTexts.menuProfile,
//               count: controller.profileCount.value,
//             ),
//           ],
//         ),
//       ),
//       body: Obx(
//         () => controller.screens[controller.selectedIndex.value],
//       ),
//     );
//   }
// }
//
// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({
//     super.key,
//     required this.currentIndex,
//     required this.items,
//     required this.onTap,
//   });
//
//   final int currentIndex;
//   final List<NavigationItemModel> items;
//   final Function(int) onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     const double iconSize = 24;
//     const double messagePromptCircleTextHeight = 1.0;
//     final List<Widget> navItems = [];
//
//     String getMessagePromptCircleText(int value) {
//       return value <= 99 ? value.toString() : '99+';
//     }
//
//     for (var i = 0; i < items.length; i++) {
//       final Color itemColor = currentIndex == i
//           ? context.colorExtension.bottomAppBarSelectedColor!
//           : context.colorExtension.bottomAppBarUnselectedColor!;
//       final TextStyle labelStyle = FontStyles.labelSmall.copyWith(
//         color: itemColor,
//         fontWeight: FontWeight.w500,
//       );
//
//       // 生成图标
//       Widget icon = currentIndex == i && items[i].selectedIcon != null
//           ? items[i].selectedIcon!
//           : items[i].icon;
//       if (items[i].icon is Icon) {
//         Icon tmpIcon = currentIndex == i && items[i].selectedIcon != null
//             ? items[i].selectedIcon! as Icon
//             : items[i].icon as Icon;
//         icon = Icon(tmpIcon.icon, size: iconSize, color: itemColor);
//       }
//
//       // 生成标签
//       Widget label = const SizedBox();
//       if (items[i].label != null) {
//         label = Text(items[i].label!, style: labelStyle);
//       }
//
//       navItems.add(
//         Expanded(
//           child: MaterialButton(
//             elevation: 0,
//             padding: const EdgeInsets.all(0),
//             onPressed: () => onTap(i),
//             child: Space(
//               direction: Axis.vertical,
//               size: UiSizes.bottomAppBarSpaceBtwIconAndLabel,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Stack(
//                   alignment: Alignment.center,
//                   clipBehavior: Clip.none,
//                   children: [
//                     icon,
//                     Positioned(
//                       top: 0 - UiSizes.messagePromptCircleSize / 4,
//                       right: 0 - UiSizes.messagePromptCircleSize / 4,
//                       child: items[i].count != 0
//                           ? Container(
//                               height: UiSizes.messagePromptCircleSize,
//                               constraints: const BoxConstraints(
//                                 minWidth: UiSizes.messagePromptCircleSize,
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: UiSizes.messagePromptCircleVerticalPadding,
//                                 horizontal: UiSizes.messagePromptCircleHorizontalPadding,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: context.colorExtension.messagePromptCircle,
//                                 borderRadius: BorderRadius.circular(
//                                   UiSizes.messagePromptCircleSize,
//                                 ),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 getMessagePromptCircleText(items[i].count),
//                                 style: FontStyles.labelSmall.copyWith(
//                                   height: messagePromptCircleTextHeight,
//                                   color: context.colorExtension.onMessagePromptCircle,
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(),
//                     ),
//                   ],
//                 ),
//                 label,
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//
//     return BottomAppBar(child: Row(children: navItems));
//   }
// }
//
// class NavigationItemModel {
//   final String? label;
//   final Widget icon;
//   final Widget? selectedIcon;
//   final int count;
//
//   const NavigationItemModel({
//     this.label,
//     required this.icon,
//     this.selectedIcon,
//     this.count = 0,
//   });
// }

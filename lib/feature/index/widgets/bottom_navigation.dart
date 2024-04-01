import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapvids_app/common/config/common_colors.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/widgets/space.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData theme = Theme.of(context).bottomNavigationBarTheme;
    final TextStyle selectedLabelStyle = theme.selectedLabelStyle ?? const TextStyle();
    final TextStyle unselectedLabelStyle = theme.unselectedLabelStyle ?? const TextStyle();
    final Color selectedItemColor = theme.selectedItemColor ?? context.theme.text_1!;
    final Color unselectedItemColor = theme.unselectedItemColor ?? context.theme.text_4!;

    final gap = (items.length / 2).ceil();

    final navItems = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      final TextStyle labelStyle = currentIndex == i ? selectedLabelStyle : unselectedLabelStyle;
      final Color color = currentIndex == i ? selectedItemColor : unselectedItemColor;

      if (gap == i) {
        navItems.add(const SizedBox(width: 60));
      }

      navItems.add(
        Expanded(
          child: MaterialButton(
            elevation: 0,
            padding: const EdgeInsets.all(0),
            onPressed: () => onTap(i),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      items[i].icon,
                      width: DesignVariables.sizeSmall,
                      height: DesignVariables.sizeSmall,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                    Positioned(
                      right: -8,
                      top: -5,
                      child: items[i].count > 0
                          ? Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: DesignVariables.spaceSmall,
                              ),
                              height: DesignVariables.sizeMini,
                              constraints: const BoxConstraints(
                                minWidth: DesignVariables.sizeMini,
                              ),
                              decoration: BoxDecoration(
                                color: CommonColors.messageTipCircle,
                                borderRadius:
                                    BorderRadius.circular(DesignVariables.borderRadiusMedium),
                              ),
                              child: Center(
                                child: Text(
                                  items[i].count <= 99 ? items[i].count.toString() : '99+',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: CommonColors.onMessageTipCircle,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
                const Space(direction: Axis.vertical, size: DesignVariables.spaceSmall),
                Text(
                  items[i].label,
                  maxLines: 1,
                  style: labelStyle.copyWith(color: color),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BottomAppBar(
      padding: EdgeInsets.zero,
      color: theme.backgroundColor,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(children: navItems),
      ),
    );
  }
}

class NavigationItemModel {
  final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.count = 0,
  });
}

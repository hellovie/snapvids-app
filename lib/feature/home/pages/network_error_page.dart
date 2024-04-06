import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/widgets/space.dart';

class NetWorkErrorPage extends StatelessWidget {
  final VoidCallback onRefresh;

  const NetWorkErrorPage({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.symmetric(horizontal: width / 5),
      child: Center(
        child: Space(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          size: DesignVariables.spaceExtraLarge,
          children: [
            const Spacer(),
            Image.asset('assets/images/undraw_stars.png'),
            const Text('网络错误'),
            const Text('当前无网络，请检查后重试'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onRefresh,
                    child: const Text('刷新'),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

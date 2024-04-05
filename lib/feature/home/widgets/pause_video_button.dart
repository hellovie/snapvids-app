import 'package:flutter/material.dart';

const double playIconSize = 128;

class PauseVideoButton extends StatelessWidget {
  final bool isPause;

  const PauseVideoButton({
    Key? key,
    required this.isPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isPause,
      child: Center(
        child: Icon(
          Icons.play_arrow_rounded,
          size: playIconSize,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}

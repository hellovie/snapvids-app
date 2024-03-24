import 'package:flutter/cupertino.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          // text: "Read our ",
          text: "阅读我们的",
          style: TextStyle(
            color: context.theme.greyColor,
            height: 1.5,
          ),
          children: [
            TextSpan(
              // text: 'Privacy Policy',
              text: '隐私政策',
              style: TextStyle(
                color: context.theme.blueColor,
              ),
            ),
            const TextSpan(
              // text: '. ',
              text: '。',
            ),
            const TextSpan(
              // text: 'Tap "Agree and continue" to accept the ',
              text: '点击“同意并继续”以接受',
            ),
            TextSpan(
              // text: 'Terms of Services',
              text: '服务条款',
              style: TextStyle(
                color: context.theme.blueColor,
              ),
            ),
            const TextSpan(
              // text: '. ',
              text: '。',
            ),
          ],
        ),
      ),
    );
  }
}

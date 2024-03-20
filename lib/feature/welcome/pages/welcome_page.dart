import 'package:flutter/material.dart';
import 'package:snapvids_app/common/widgets/custom_elevated_button.dart';
import 'package:snapvids_app/feature/welcome/widgets/language_button.dart';
import 'package:snapvids_app/feature/welcome/widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    String splashTopBackground = currentTheme.brightness == Brightness.dark
        ? 'assets/images/splash_top_background_dark.png'
        : 'assets/images/splash_top_background_light.png';

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  child: Image.asset(
                    splashTopBackground,
                    // color: context.theme.splashTopBgColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Welcome to Snapvids',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const PrivacyAndTerms(),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'AGREE AND CONTINUE',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const LanguageButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
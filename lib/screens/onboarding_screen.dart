import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/data/sharedprefs/shared_preference_helper.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/widgets/onboarding.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(viewportFraction: 1);
  SharedPreferenceHelper prefs = SharedPreferenceHelper();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondarycolor,
      body: Container(
        width: double.infinity,
        color: kSecondarycolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Onboarding(),
            const Gap(20),
            MyTextButton(
              onTap: () {
                prefs.setSeenOnboarding();
                goToReplace(context, const LoginScreen());
              },
              text: 'Log in',
              bgcolor: kSecondarycolor,
              fgcolor: kPrimarycolor,
              width: screenWidth * 0.9,
              textStyle: TextStyle(
                  color: kPrimarycolor, fontWeight: bold, fontSize: 20),
              borderSide: BorderSide(width: 1.0, color: kPrimarycolor),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
